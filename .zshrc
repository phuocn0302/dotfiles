# Lines configured by zsh-newuser-install
HISTFILE=~/.config/.zsh/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
# zstyle :compinstall filename '/home/Phuoc/.zshrc'

#autoload -U compinit; compinit
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)	
# End of lines added by compinstall

# Set theme
source ~/.config/.zsh/Themes/common.zsh-theme 

# Plugins
source ~/.config/.zsh/Plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/.zsh/Plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source ~/.config/.zsh/Plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source ~/.config/.zsh/Plugins/zsh-sudo/zsh-sudo.zsh
source ~/.config/.zsh/Plugins/zsh-shift-select/zsh-shift-select.plugin.zsh
# source ~/.config/.zsh/Plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

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
# Thanks Ron! (see comments)
function TRAPINT() {
  vim_mode=$vim_ins_mode
  return $(( 128 + $1 ))
}


# Export
export EDITOR=nvim
export PISTOL_CHROMA_STYLE=vim
export PF_INFO="ascii title os uptime pkgs memory palette"

# Aliases
alias vim="nvim"
alias vi="nvim"
alias lsa="ls -a"

alias zshcf="nvim ~/.zshrc"
alias bspcf="nvim ~/.config/bspwm/bspwmrc"
alias sxhkcf="nvim ~/.config/sxhkd/sxhkdrc"
alias kittycf="nvim ~/.config/kitty/kitty.conf"
alias zshc="source ~/.zshrc"
alias warpstart="systemctl start warp-svc.service"
alias warpstop="systemctl stop warp-svc.service"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

fetch
