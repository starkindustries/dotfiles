# Dotfiles

## tmux

Run this command to copy `.tmux.conf` to your home directory:
```
wget -P ~ https://raw.githubusercontent.com/starkindustries/dotfiles/refs/heads/main/.tmux.conf
```

## hyperland

Run this command to copy `hyperland.conf` to `~/.config/hypr` directory:
```
wget -P ~/.config/hypr https://raw.githubusercontent.com/starkindustries/dotfiles/refs/heads/main/hyprland.conf
```

Diff between this and the default config:
```
$ diff hyprland.conf default.conf
181c181
<     kb_options = caps:escape
---
>     kb_options =
272,275d271
< 
< # Custom audio controls for my 78-key keyboard
< bindel = , F5, exec, pactl set-sink-volume @DEFAULT_SINK@ -1%
< bindel = , F6, exec, pactl set-sink-volume @DEFAULT_SINK@ +1%
```

## bash

Run this command to copy `.bashrc` to your home directory:
```
wget -P ~ https://raw.githubusercontent.com/starkindustries/dotfiles/refs/heads/main/.bashrc
```

Remember to source the file:
```
source ~/.bashrc
```
