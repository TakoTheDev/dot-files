### Install pipewire

`archinstall` at the time of writing this doesn't work when installing `pipewire`.
```sh
$ sudo pacman -S pipewire pipewire-pulse pipewire-jack wireplumber
$ systemctl --user --now start pipewire pipewire-pulse wireplumber
```

### Install paru

`paru` is a better version of `yay`.
```sh
$ sudo pacman -S git rustup
$ rustup default stable
$ git clone https://aur.archlinux.org/paru.git ~/Downloads/paru
$ cd ~/Downloads/paru
$ makepkg -si

# To clean-up the files after you're done
$ rm -rf ~/Downloads/paru
```

### Install eww

`eww` is a highly advanced widget manager.
```sh
$ sudo pacman -S gtk3 gtk-layer-shell pango gdk-pixbuf2 cairo glib2 gcc-libs glibc
$ git clone https://github.com/elkowar/eww ~/Downloads/eww
$ cd ~/Downloads/eww
$ cargo build --release --no-default-features --features=wayland
$ cd target/release
$ chmod +x ./eww.d
$ sudo cp eww /usr/local/bin/eww

# To clean-up the files after you're done
$ rm -rf ~/Downloads/eww
```

### Install zsh and starship

`zsh` is a customizable shell and `starship` is a very awesome prompt.
```diff
$ sudo pacman -S zsh starship
$ chsh -s $(which zsh)
$ bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
$ nvim ~/.zshrc
+ PROMPT='%F{green}%T %F{cyan}%B%~%b%F{white}$ '
+ # Alternatively
+ # PROMPT='%B%F{blue}%n@%M %F{green}%~%F{white}%b$ '
+ 
+ bindkey "^[[1;5C" forward-word
+ bindkey "^[[1;5D" backward-word
+ bindkey '^ ' autosuggest-accept
+ 
+ alias vim="nvim"
+ alias ..="cd .."
+ alias home="cd ~"
+ alias update="sudo pacman -Syu"
+ # [..]
+ zinit load zsh-users/zsh-autosuggestions
+ zinit load zsh-users/zsh-syntax-highlighting
$ echo eval "$(starship init zsh)" >> .zshrc
```

### pacman Quality Of Life

Some useful improvements for our favorite package manager.
```diff
$ sudo nvim /etc/pacman.conf
+ Color
+ ILoveCandy
- #Color
+ ParallelDownloads = 5
- #ParallelDownloads = 5
$ sudo pacman -S pacman-contrib
$ systemctl enable paccache.timer
```

### Nvidia Improvements

Nvidia is a bad company so we need to add some fixes for `hyprland` to work as best as possible.
```diff
$ sudo pacman -S nvidia-open-dkms qt5-wayland qt5ct libva linux-headers
$ sudo nvim /etc/default/grub
+ GRUB_CMDLINE_LINUX_DEFAULT="[..] nvidia_drm.modeset=1"
- GRUB_CMDLINE_LINUX_DEFAULT="[..]"
$ sudo grub-mkconfig -o /boot/grub/grub.cfg
$ sudo nvim /etc/mkinitcpio.conf
+ MODULES=([..] nvidia nvidia_modeset nvidia_uvm nvidia_drm)
- MODULES([..])
$ sudo mkinitcpio -P
$ sudo nvim /etc/modprobe.d/nvidia.conf
+ options nvidia-drm modeset=1
```

### Increase zram Size

This is useful if you don't have a lot of ram.
```diff
$ sudo nvim /etc/systemd/zram-generator.conf
+ [zram0]
+ zram-size = ram / 4
+ compression-algorithm = zstd
+ swap-priority = 100
+ fs-type = swap
$ systemctl start systemd-zram-setup@zram0.service
```

### List Of Packages

This is a list of all packages, required and optional.
```diff
# pacman packages
$ sudo pacman -S obsidian wezterm ttf-jetbrains-mono-nerd noto-fonts-emoji neovim unzip npm udiskie neofetch noto-fonts-cjk noto-fonts gparted glxgears polkit-gnome swayidle discord thunar gvfs thunar-archive-plugin ark tumbler ffmpegthumbnailer ntfs-3g rofi cliphist nvtop steam intellij-idea-community-edition spotify-laucher

# Install NvChad
$ git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim

# Install Vencord
$ sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"

# Optionally you can remove kitty
$ sudo pacman -R kitty
$ rm -rf ~/.config/kitty

# paru packages
$ paru -S hyprshot jdk17-openjdk mindustry swaylock-effects-git wlogout swww python-pywal cbonsai google-chrome hyprland-nvidia

# DO NOT FORGET
# Integrate the files from the github
# DO NOT FORGET

# If you don't have a Nvidia GPU you can remove these
$ sudo pacman -R nvtop
$ nvim ~/.config/hypr/env.conf
- env = LIBBVA_DRIVER_NAME,nvidia
- env = XDG_SESSION_TYPE,wayland
- env = __GLX_VENDOR_LIBRARY_NAME,nvidia
- env = WLR_NO_HARDWARE_CURSORS,1

# Reboot to check if everything worked
$ reboot
```

### Notes To Self

Just some Notes so I don't forget something.
```q
~
├── .config
│   ├── dunst
│   ├── eww
│   ├── gtk-2.0 not done
│   ├── gtk-3.0
│   ├── gtk-4.0 not done
│   ├── hypr
│   ├── neofetch
│   ├── rofi
│   ├── swaylock
│   ├── Vencord
│   │   └── settings
│   ├── wlogout
│   └── starship.toml
├── Obsidian
│   └── Notes
│   │   ├── .obsidian not done
│       └── Arch Linux.md not done
└── .wezterm.lua not done
```

### Stuff To Style

A list of stuff I need to style.
- [x] obsidian
- [ ] wezterm
- [ ] neovim
- [x] [neofetch](https://github.com/chick2d/neofetch-themes/blob/main/normal/config2.conf)
- [x] [gnome-stuff(thunar, polkit, gparted)](https://github.com/catppuccin/gtk/tree/main)
- [ ] rofi
- [x] [starship](https://starship.rs/presets/nerd-font.html)
- [x] [wlogout](https://github.com/AmitGolden/dotfiles/tree/main)
- [x] [google-chrome](https://chrome.google.com/webstore/detail/catppuccin-chrome-theme-m/bkkmolkhemgaeaeggcmfbghljjjoofoh)
- [ ] hyprland
- [ ] eww
- [x] [discord](https://catppuccin.github.io/discord/dist/catppuccin-mocha-pink.theme.css)
