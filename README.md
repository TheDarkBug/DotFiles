# DotFiles

My .files, here is a preview (_keep in mind: the screenshots are not updated_):

Also, [here](https://github.com/TheDarkBug/DotFiles/blob/main/wallpapers.md)'s a list of the wallpapers I'm using and have used in past configurations.

![](https://raw.githubusercontent.com/TheDarkBug/DotFiles/main/dotfiles.png)

## Programs and other resources used

_A command to install all the dependances will be printed after running the `./install` script (arch linux only)._

- WM: [hyprland](https://hyprland.org/)

- Color scheme: [GruvBox](https://github.com/morhetz/gruvbox)

- Wallpaper: [none](#)

- Terminal: [Alacritty](https://alacritty.org/)

- Shell: [zsh](https://wiki.archlinux.org/index.php/zsh)

- Fetch tool: [UwUfetch](https://github.com/TheDarkBug/uwufetch)

- Zsh prompt: [Starship](https://starship.rs/)

- Bar: [Waybar](https://github.com/Alexays/Waybar)

- Launcher: [Rofi](https://github.com/davatorium/rofi)

- File manager: [Nautilus](https://gitlab.gnome.org/GNOME/nautilus)

- Fonts: [JetBrains Mono](https://www.jetbrains.com/lp/mono/), [Nerd Fonts](https://www.nerdfonts.com/)

- Notifications: [Mako](https://github.com/emersion/mako)

- Audio: [Pipewire](https://pipewire.org/) + [wireplumber](https://pipewire.pages.freedesktop.org/wireplumber/)

- Screenshot: [grimshot](https://github.com/swaywm/sway/blob/master/contrib/grimshot)

### Other dependances

- [swaylock-effects](https://github.com/jirutka/swaylock-effects): locks wayland session

- [swayidle](https://github.com/swaywm/swayidle): lock the session before hibernating/suspending

- [rofi-lbonn-wayland](https://github.com/lbonn/rofi): rofi but for wayland

- [waybar-hyprland](https://aur.archlinux.org/packages/waybar-hyprland): waybar but the workspaces widget works with hyprland

- [rofi-calc](https://github.com/svenstaro/rofi-calc), rofi-file-browser-extended: some useful rofi "extensions"

- [syncthing](https://syncthing.net/): syncs things

- [gammastep](https://gitlab.com/chinstrap/gammastep): like redshift but for wayland

- [sunshine](https://github.com/LizardByte/Sunshine): server for [moonlight](https://moonlight-stream.org/)

- [polkit-gnome](https://wiki.gnome.org/Projects/PolicyKit): graphical authentication

- [wlogout](https://github.com/ArtsyMacaw/wlogout): logout window for wayland

## Installation

Run

```shell
mkdir .config && cd .config
git clone --recursive https://github.com/TheDarkBug/DotFiles.git
cd DotFiles
./install -a
```

Before the installation begins, a backup of your current configuration will be automatically generated in `~/config_backup`.

## Post installation

This post installation to-do list is mainly for me as I use arch linux (btw) and I **always** forget to do this things.

- `systemctl --user enable --now pipewire.service pipewire.socket wireplumber # WhY IsN't PiPeWiRe WoRKiNg?? Well, that's why. Also maybe installing sof-firmware is a good idea`
- Setup [swapfile](https://wiki.archlinux.org/title/Swap#Swap_file) and [hibernation](https://wiki.archlinux.org/title/Power_management/Suspend_and_hibernate#Hibernation_into_swap_file)
- To enable pipewire video capture in obs, you need to `pacman -S xdg-desktop-portal-wlr`, and go in `Settings > Output > set "Output Mode" to "Advanced" > Streaming > set "Encoder" to the "VAAPI" option` and that should be it
- Ask for password and fingerprint at the same time: `paru -S pam-fprint-grosshack`, then add `auth sufficient pam_fprintd_grosshack.so\nauth sufficient pam_unix.so try_first_pass nullok` to `/etc/pam.d/{swaylock,login,polkit-1,su,sudo,system-local-login,system-auth}`
- Suppress boot logs and enable sysrq (boot parameters): `quiet loglevel=3 udev.log_level=3 sysrq_always_enabled=1`
