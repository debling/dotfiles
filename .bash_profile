#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

source /etc/profile

export GOPATH="$HOME/go"
export PATH="$PATH:$HOME/.roswell/bin:$HOME/Scripts:$GOPATH/bin:$HOME/.cargo/bin:$HOME/.npm/bin"

export EDITOR="emacsclient -t"
export ALTERNATE_EDITOR="nvim"
export SUDO_EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"
export READER="zathura"
export PAGER="less"

export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
export _JAVA_AWT_WM_NONREPARENTING=1

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

eval "$(dircolors)"

if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep -x dwm || exec startx &> /dev/null
fi
