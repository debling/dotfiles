#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export GOPATH="$HOME/go"
export PATH="$HOME/.roswell/bin:$HOME/Scripts:$PATH:$GOPATH/bin:$HOME/.cargo/bin"

export EDITOR="emacsclient -t"
export ALTERNATE_EDITOR="vim"
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"
export PAGER="less"

export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
export _JAVA_AWT_WM_NONREPARENTING=1

if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep -x dwm || exec startx &> /dev/null
fi
