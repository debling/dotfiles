#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS1="\[\033[ 01;37m\]\$([[ \$? == 0 ]] || echo \"\[\033[01;31m\]\$?\")\W \$ "

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_UNTRACKEDFILES=1
export PROMPT_COMMAND='__git_ps1 "\$([[ \$? == 0 ]] || echo \"\[\033[01;31m\]\$? \")\[\033[34;1m\]\W\[\033[0m\]" " \\$\[\033[0m\] "'

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
    eval "$("$BASE16_SHELL/profile_helper.sh")"

eval "$(fasd --init auto)"

alias j="fasd_cd -d"

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

alias ls='ls -hN --color=auto --group-directories-first'
alias grep="grep --color=auto"
alias mkd="mkdir -pv"
alias mktd='cd $(mktemp -d)'

alias gn="grep -win -A 1 $HOME/Uni/*/*/*.org -e"

alias p="sudo pacman"
alias pr="sudo pacman -Rsn"
alias prorphan='sudo pacman -Rns $(pacman -Qtdq)'

alias SS="sudo systemctl"
alias ss="systemctl --user"

alias pg="sudo systemctl start postgresql"
alias spg="sudo systemctl stop postgresql"

alias v="vim"
alias sv="sudo vim"

alias e="emacsclient -t"
alias ec="emacsclient -c"

alias g="git"
alias gc="git clone"
alias gct="git commit -S"
alias ga="git add"

alias ka="killall"

alias mountnfs="mount -t nfs -o vers=4"
alias rbak="rsync -P -a --delete"

alias susp="sudo systemctl suspend"

alias gqb="qutebrowser --qt-flag ignore-gpu-blacklist --qt-flag enable-gpu-rasterization --qt-flag enable-native-gpu-memory-buffers --qt-flag num-raster-threads=4"

alias swk='wol -i 192.168.25.20 04:7D:7B:DE:9B:07'
alias sst='ssh -t void@192.168.25.20 "sudo shutdown -h now"'
alias scn='ssh void@192.168.25.20'
alias wifi='sudo ip link set wlp3s0'

source /usr/share/bash-completion/bash_completion
source /usr/share/git/completion/git-prompt.sh

alias brmod='java -jar /home/debling/Downloads/brModelo.jar'
alias arec='arecord -f dat -t wav'

alias gpg='gpg2'
alias ytd='youtube-dl -o "%(title)s.%(ext)s"'

alias xclipi="xclip -i -selection clipboard"
