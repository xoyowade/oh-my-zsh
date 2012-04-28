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
plugins=(git)
plugins_ruby=(bundler rails3 ruby rvm)
HOST=`hostname`
case $HOST in
    *mac)
	plugins+=(osx)
	if [[ "$HOST" == "xoyo-mac" ]]; then
	    plugins=($plugins $plugins_ruby)
	    plugins+=(github pow)
	fi
	;;
    brick*)
	plugins+=(debian gnu-utils)
	;;
esac

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
ZSH_CUSTOM=$ZSH/custom

# Common config

# Load required modules.
autoload -U add-zsh-hook
autoload -Uz vcs_info

# if [[ -n $STY || -n $TMUX ]]; then
#     function title() { print -Pn "\ek$1\e\\"}
#     function precmd_title() { title "%20<..<%~%<<" }
#     function preexec_title() { title "%20>..>$1%<<" }
#     #export PS1="%{${fg[cyan]}%}[%D{%H:%M} %20<..<%~%<<]%{$reset_color%} "
# else
#     #export PS1="%{${fg[cyan]}%}[%D{%H:%M} %n@%m:%20<..<%~%<<]%{$reset_color%} "
# fi
if growlnotify -h &>/dev/null; then
    function growl_precmd() {
	if [[ ${DO_GROWL} -eq 1 ]]; then
            # Growl notify
            # Time after which trigger a growl notification
            DELAY_AFTER_NOTIFICATION=3
            
            # Get the start time, or set it to now if not set
            start=${PREEXEC_TIME:-`date +'%s'`}
            stop=$(date +'%s')
            
            let elapsed=$stop-$start
            
            if [ $elapsed -gt $DELAY_AFTER_NOTIFICATION ]; then
		growlnotify -m "took $elapsed secs" "${PREEXEC_CMD}" > /dev/null 2>&1
            fi
	fi
    }
    function growl_preexec () {
	export PREEXEC_TIME=$(date +'%s')
	export PREEXEC_CMD="$1"

	cmd=${(z)1[(w)0]}
	if [[ $cmd == "sudo" ]]; then
            cmd=${(z)1[(w)2]}
	fi

	# notify only these commands
	# export DO_GROWL=0
	# GROWL_COMMANDS=(rsync scp cp ftp curl wget axel 
	#     svn git make rake bundle rails
	#     sleep
	# )
	export DO_GROWL=1
	GROWL_IGNORE_COMMANDS=(vi vim emacs sudoedit 
	    less more cat 
	    ssh
	    autotest service 
	)
	for i in $GROWL_IGNORE_COMMANDS; do
            if [[ $cmd == $i ]]; then
		export DO_GROWL=0
		return
            fi
	done
    }
    add-zsh-hook precmd growl_precmd
    add-zsh-hook preexec growl_preexec
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
	alias aptinstall='sudo apt-get install'
	alias aptsearch='apt-cache search'
	;;
esac


