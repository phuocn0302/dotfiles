HISTFILE=$HOME/.config/zsh/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt no_nomatch

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -d "$HOME/.config/zsh/.zcompdump"
_comp_options+=(globdots)

if [[ -f "$HOME/.config/zsh/.zprofile" ]]; then
  source "$HOME/.config/zsh/.zprofile"  
fi

# Set theme
source $HOME/.config/zsh/Themes/common.zsh-theme

# Plugins
ZSH_PLUGIN_DIR="$HOME/.config/zsh/Plugins"

plugins=(
  zdharma-continuum/fast-syntax-highlighting
  zsh-users/zsh-autosuggestions
  marlonrichert/zsh-autocomplete
  jeffreytse/zsh-vi-mode
  none9632/zsh-sudo
  jirutka/zsh-shift-select
)

for plugin in "${plugins[@]}"; do
  user="${plugin%%/*}"
  repo="${plugin##*/}"

  plugin_path="$ZSH_PLUGIN_DIR/$repo"
  url="https://github.com/$plugin.git"

  if [ ! -d "$plugin_path" ]; then
    echo "Cloning $repo"
    git clone --depth=1 "$url" "$plugin_path" > /dev/null 2>&1
  fi

  # Source the plugin, ensure .zsh file contain plugin name
  for file in "$plugin_path"/*.zsh(N); do
    if [[ "$(basename "$file")" == *"$repo"* ]]; then
      source "$file"
      break
    fi
  done
done

# Changing dir upon quitting lf
lf () {
    tmp="$(mktemp)"
    /usr/bin/lf --last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}
# Fix a bug when you C-c in CMD mode and you'd be prompted with CMD mode indicator, while in fact you would be in INS mode
# Fixed by catching SIGINT (C-c), set vim_mode to INS and then repropagate the SIGINT, so if anything else depends on it, we will not break it
function TRAPINT() {
    vim_mode=$vim_ins_mode
    return $(( 128 + $1 ))
}

function toggle_service() {
  local SERVICE="$1"
  if systemctl is-active --quiet "$SERVICE"; then
    echo "Stopping $SERVICE..."
    sudo systemctl stop "$SERVICE"
  else
    echo "Starting $SERVICE..."
    sudo systemctl start "$SERVICE"
  fi
}

# Export
export EDITOR=nvim
export PISTOL_CHROMA_STYLE=vim
export PF_INFO="ascii title os uptime pkgs memory palette"
export PATH="$HOME/.local/bin:$PATH"

# Aliases
alias vim="nvim"
alias vi="nvim"
alias v="nvim"
alias nivm="nvim"

alias lsa="ls -al"

alias yeet="yay -Rsn"

alias zshcf="nvim $HOME/.config/zsh/.zshrc"
alias bspcf="nvim $HOME/.config/bspwm/bspwmrc"
alias sxhkcf="nvim $HOME/.config/sxhkd/sxhkdrc"
alias kittycf="nvim $HOME/.config/kitty/kitty.conf"

alias zshc="source $HOME/.config/zsh/zshrc"

alias status="systemctl status"
alias warp="toggle_service warp-svc"

for sudo_typo in sduo sodu suod soud; do
  alias $sudo_typo='sudo'
done

# Init zoxide
eval "$(zoxide init zsh --cmd cd)"

if [ -f "$HOME/.cache/wal/sequences" ]; then
    cat "$HOME/.cache/wal/sequences"
fi

fetch
