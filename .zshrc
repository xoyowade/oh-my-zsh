# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
ZSH_CUSTOM=$ZSH/custom

# Common config
if [[ -n $STY || -n $TMUX ]]; then
    function title() { print -Pn "\ek$1\e\\"}
    function precmd() { title "%20<..<%~%<<" }
    function preexec() { title "%20>..>$1%<<" }
    #export PS1="%{${fg[cyan]}%}[%D{%H:%M} %20<..<%~%<<]%{$reset_color%} "
else
    #export PS1="%{${fg[cyan]}%}[%D{%H:%M} %n@%m:%20<..<%~%<<]%{$reset_color%} "
fi


alias lla='ls -la'
alias rake='noglob rake'
alias emacsopen='emacsclient -n -a vim'
alias gc='git ci -am'
alias gs='git status'

KERNEL=`uname`
case $KERNEL in
	Darwin*)
	growl() { growlnotify -m "${1}"; return ; }
		alias du1='du -h -d 1'
		;;
	Linux*)
	growl() { echo -e $'\e]9;'${1}'\007' ; return ; }
		alias du1='du -h --max-depth=1'
		;;
esac


