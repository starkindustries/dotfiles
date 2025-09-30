#!/bin/bash
#
# Dotfile Configuration Comparator - Bash Script
#
# This script is designed to be run from the root of your dotfiles repository.
# It automatically finds all regular files within the current directory and 
# compares them against the corresponding live configuration files in the user's home directory (~).
#

# --- Main Logic ---

# Determine the absolute path to the repository root (the current directory)
REPO_ROOT="$(pwd)"
HOME_DIR="${HOME}"

# Flag to track overall status
# 0 means all matched (success), 1 means differences found (failure)
ALL_MATCHED=0 

echo "Comparing ALL files in the current repository against live configurations in '~'"
echo "--------------------------------------------------"

# Use process substitution (< <(...)) instead of a pipe (|).
# This is crucial because it makes the 'while' loop run in the current shell, 
# allowing the ALL_MATCHED variable to be correctly updated and preserved.
while IFS= read -r -d $'\0' REPO_FILE_FULL; do
    
    # Calculate the path relative to the home directory (~/)
    # ${var#prefix} removes the longest matching prefix (which is $REPO_ROOT/) from the path
    relative_path="${REPO_FILE_FULL#${REPO_ROOT}/}"

    # Define the full path for the live configuration file in the user's home directory
    LIVE_FILE="${HOME_DIR}/${relative_path}"
    
    echo "Checking: ${relative_path}"

    # 1. Check if the live config file exists
    if [ ! -f "${LIVE_FILE}" ]; then
        echo "  [MISSING] Live file not found: ${LIVE_FILE} - Consider symlinking or installation."
        ALL_MATCHED=1
        continue
    fi
    
    # 2. Use 'diff -u' for detailed comparison
    # '-u' forces the unified output format
    
    # Run diff and capture output and exit code
    DIFF_OUTPUT=$(diff -u "${REPO_FILE_FULL}" "${LIVE_FILE}" 2>/dev/null)
    DIFF_EXIT_CODE=$?

    if [ "${DIFF_EXIT_CODE}" -eq 0 ]; then
        # Exit code 0 means files are identical
        echo "  [MATCH] Files are identical."
    elif [ "${DIFF_EXIT_CODE}" -eq 1 ]; then
        # Exit code 1 means files are different
        echo "  [DIFFER] Differences found (Repo vs Live):"
        echo "  ================================================"
        # Print the diff output, adding indentation for readability
        echo "${DIFF_OUTPUT}" | sed 's/^/  /g'
        echo "  ================================================"
        ALL_MATCHED=1
    else
        # Exit code > 1 means an error occurred (e.g., file permissions)
        echo "  [ERROR] Diff failed (exit code ${DIFF_EXIT_CODE})."
        ALL_MATCHED=1
    fi
    
done < <(find "${REPO_ROOT}" -type f -not -path '*/.git/*' -print0)

echo "--------------------------------------------------"

if [ "${ALL_MATCHED}" -eq 0 ]; then
    echo "All checked configuration files match your dotfiles repository!"
else
    echo "Differences were found. Review the detailed output above."
fi

# Exit with the status flag (0 for success, 1 for failure/diffs found)
exit "${ALL_MATCHED}"

