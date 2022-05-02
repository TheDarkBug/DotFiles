printf "\033[1;33mWARNING: THIS IS GOING TO MOVE MOST OF YOUR CONFIG FILES TO A BACKUP DIRECTORY: $HOME/config_backup\033[1;0m\n"
printf "Are you sure that you want to continue? (y/N): "
read choice
[ "$choice" == "n" ] || [ -z "$choice" ] && printf "Ok, you will install manually\n" && exit
printf "Installing...\n"

cwd=$(pwd)
configdir="$XDG_CONFIG_HOME"
[ -z "$configdir" ] && configdir="$HOME/.config"
[ -d "$configdir" ] || mkdir -p "$configdir"

[ -d $HOME/config_backup ] || mkdir -pv $HOME/config_backup
mv -vt $HOME/config_backup \
	$configdir/alacritty \
	$configdir/bspwm \
	$configdir/dunst \
	$configdir/htop \
	$configdir/i3 \
	$configdir/init.sh \
	$configdir/keyd \
	$configdir/kitty \
	$configdir/libinput-gestures.conf \
	$configdir/mako \
	$configdir/nvim \
	$configdir/picom \
	$configdir/polybar \
	$configdir/river \
	$configdir/rofi \
	$configdir/starship.toml \
	$configdir/sxhkd \
	$configdir/sway \
	$configdir/swaylock \
	$configdir/waybar \
	$configdir/uwufetch \
	$configdir/zsh \
	$HOME/.emacs.d \
	$HOME/.env \
	$HOME/.vim* \
	$HOME/.xinitrc \
	$HOME/.zshrc

local_bin_files=$(ls bin)
for f in $(ls $HOME/.local/bin); do
	df=$(echo "$local_bin_files" | grep -e "^$f$")
	[ -z "$df" ] || mv $HOME/.local/bin/$df $HOME/config_backup
done

mv $HOME/.var/app/org.mozilla.firefox/config/fontconfig/fonts.conf $HOME/config_backup

ln -vs  $cwd/config/alacritty \
	$cwd/config/bspwm \
	$cwd/config/dunst \
	$cwd/config/htop \
	$cwd/config/i3 \
	$cwd/config/init.sh \
	$cwd/config/keyd \
	$cwd/config/kitty \
	$cwd/config/libinput-gestures.conf \
	$cwd/config/mako \
	$cwd/config/nvim \
	$cwd/config/picom \
	$cwd/config/polybar \
	$cwd/config/river \
	$cwd/config/rofi \
	$cwd/config/starship.toml \
	$cwd/config/sxhkd \
	$cwd/config/sway \
	$cwd/config/swaylock \
	$cwd/config/waybar \
	$cwd/config/uwufetch \
	$cwd/config/zsh \
	$configdir

ln -s \
	$cwd/home/.emacs.d \
	$cwd/home/.env \
	$cwd/home/.vim* \
	$cwd/home/.xinitrc \
	$cwd/config/zsh/.zshrc \
	$HOME

for f in $(ls bin); do
	ln -s $cwd/$f $HOME/.local/bin
done


ln -s $cwd/other/fffonts.conf $HOME/.var/app/org.mozilla.firefox/config/fontconfig/fonts.conf

printf "Installed correctly!\n"
printf "you should also
\tln -s $cwd/other/tlp.conf /etc\n
\tln -s $cwd/config/alacritty/alacritty.gruvbox.dark $configdir/alacritty/alacritty.yml\n"
