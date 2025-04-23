#!/usr/bin/sh

set -e

if [ -n "$SUDO_USER" ]; then
  USER_HOME=$(eval echo ~$SUDO_USER)  
else
  USER_HOME=$HOME  
fi


DEFAULT_DIR="$(cd "$(dirname "$0")" && pwd)"

backup_config() {
  cd "$DEFAULT_DIR"

  TIMESTAMP=$(date +%Y%m%d%H%M%S)
  BACKUP_DIR="$DEFAULT_DIR/backup/$TIMESTAMP"

  mkdir -p "$BACKUP_DIR"

  for entry in "$DEFAULT_DIR"/* "$DEFAULT_DIR"/.config/*; do
    [ -f "$entry" ] || [ -d "$entry" ] || continue

    rel_path="${entry#$DEFAULT_DIR/}"
    target_path="$USER_HOME/$rel_path"

    if [ -e "$target_path" ]; then
      mkdir -p "$(dirname "$BACKUP_DIR/$rel_path")"

      mv "$target_path" "$BACKUP_DIR/$rel_path"
    fi
  done
}

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
  backup_config
  stow -v -t "$USER_HOME" .  
  wal --theme yotsu.json
  feh --bg-center Wallpapers/Yotsugi1080.png
}

if ! command -v yay > /dev/null 2>&1; then
  echo "yay is not installed. Installing..."
  install_yay
else
  echo "yay is already installed."
fi

# Install dotfiles and apply theme
install_dotfiles

