# Dotfiles

## tmux

Run this command to copy `.tmux.conf` to your home directory:
```
wget -P ~ https://raw.githubusercontent.com/starkindustries/dotfiles/refs/heads/main/.tmux.conf
```

## hyperland

Run this command to copy `hyperland.conf` to `~/.config/hypr` directory:
```
wget -P ~/.config/hypr https://raw.githubusercontent.com/starkindustries/dotfiles/refs/heads/main/.config/hypr/hyprland.conf
```

Diff between this and the default config:
```
$ diff hyprland.conf default.conf
71c71
<     gaps_out = 10
---
>     gaps_out = 20
73c73
<     border_size = 1
---
>     border_size = 2
80,81c80
<     resize_on_border = true
<     hover_icon_on_border=true
---
>     resize_on_border = false
91,92c90,91
<     rounding = 0
<     rounding_power = 2.0 # Not applicable if 'rounding' is zero
---
>     rounding = 10
>     rounding_power = 2
168,170c167,168
<     # force_default_wallpaper options are -1 (random), 0 (hypr logo), 1 (triangles), 2 (anime girl)
<     force_default_wallpaper = 0
<     disable_hyprland_logo = false # If true disables the hyprland wallpaper
---
>     force_default_wallpaper = -1 # Set to 0 or 1 to disable the anime mascot wallpapers
>     disable_hyprland_logo = false # If true disables the random hyprland logo / anime girl background. :(
183c181
<     kb_options = caps:escape
---
>     kb_options =
274,277d271
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

## Arch Setup Script

Copy the setup script to your home directory with this command:
```
wget -P ~ https://raw.githubusercontent.com/starkindustries/dotfiles/refs/heads/main/archsetup.sh
```

Review and run the setup script to install the bare necessities.
