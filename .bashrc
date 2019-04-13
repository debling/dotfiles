#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source /etc/bashrc

#PS1="\[\033[ 01;37m\]\$([[ \$? == 0 ]] || echo \"\[\033[01;31m\]\$?\")\W \$ "

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_UNTRACKEDFILES=1
export PROMPT_COMMAND='__git_ps1 "\$([[ \$? == 0 ]] || echo \"\[\033[01;31m\]\$? \")\$([[ -n \"$IN_NIX_SHELL\" ]] && echo \"[nix-shell] \")\[\033[34;1m\]\W\[\033[0m\]" " \\$\[\033[0m\] "'
export HISTSIZE=1000000
export HISTFILESIZE=1000000

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
    eval "$("$BASE16_SHELL/profile_helper.sh")"

eval "$(fasd --init auto)"

jj()
{
  local dir
  dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && cd "${dir}" || return 1
}

shopt -s checkwinsize
shopt -s autocd
shopt -s nocaseglob
shopt -s cdspell
shopt -s extglob

bind '"\eh": "\C-a\eb\ed\C-y\e#man \C-y\C-m\C-p\C-p\C-a\C-d\C-e"'

source $HOME/.config/alias

if command -v fzf-share >/dev/null; then
  source "$(fzf-share)/key-bindings.bash"
fi
