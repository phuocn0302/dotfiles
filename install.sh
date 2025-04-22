#!/usr/bin/sh

set -e

if [ -n "$SUDO_USER" ]; then
  USER_HOME=$(eval echo ~$SUDO_USER)  
else
  USER_HOME=$HOME  
fi


DEFAULT_DIR="$(cd "$(dirname "$0")" && pwd)"

install_yay() {
  cd "$DEFAULT_DIR"

  sudo pacman -S --needed git base-devel
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si

  cd ..
  rm -rf yay
}

install_package() {
  cd "$DEFAULT_DIR"

  yay -S --needed - < pkg_lists.txt
}

install_dotfiles() {
  cd "$DEFAULT_DIR"

  install_package
  wal --theme yotsu.json
  feh --bg-center Wallpapers/Yotsugi1080.png
  stow -v -t "$USER_HOME" .  
}

if ! command -v yay > /dev/null 2>&1; then
  echo "yay is not installed. Installing..."
  install_yay
else
  echo "yay is already installed."
fi

# Install dotfiles and apply theme
install_dotfiles

