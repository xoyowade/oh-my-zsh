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
plugins_linux=(gnu-utils)
plugins_ruby=(bundler rails3 ruby rvm)
plugins_qq=($plugins_linux svn)
HOST=`hostname`
case $HOST in
    *mac)
	plugins+=(osx)
	if [[ "$HOST" == "xoyo-mac" ]]; then
	    plugins+=$plugins_ruby
	    plugins+=(github pow)
	fi
	;;
    YinKe*)
	plugins+=$plugins_qq
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
GROWL_SERVER_IP=`echo $SSH2_CLIENT | awk '{print $1}'`
GROWL_SERVER_OPT=""
[[ "$GROWL_SERVER_IP" = "" ]] || GROWL_SERVER_OPT="-H $GROWL_SERVER_IP"
if growlnotify -v &>/dev/null; then
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
		growlnotify $GROWL_SERVER_OPT -t "${PREEXEC_CMD}" -m "took $elapsed secs"> /dev/null 2>&1
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
	GROWL_IGNORE_COMMANDS=(
		vi vim vimdiff emacs sudoedit 
	    less more man gdb
	    ssh mosh tmux
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
alias svn='nocorrect svn'
alias svnhist='svn log -v -l 3'
alias make='make -j4'
alias m='make'
alias grepr='grep -R'
alias grepcode='nocorrect grepcode'
function grepcode {
	dir=$2
	find $dir -path '*/.svn' -prune -o -type f -print | grep -v "cscope" | grep -v "CMakeFiles" | xargs grep -Ine $1
}

KERNEL=`uname`
case $KERNEL in
    Darwin*)
	growl() { growlnotify -m "${1}"; return ; }
	alias du1='du -h -d 1'
	;;
    Linux*)
	growl() { growlnotify "${1}" ""; return ; }
	#growl() { echo -e $'\e]9;'${1}'\007' ; return ; }
	alias du1='du -h --max-depth=1'
	alias aptinstall='sudo apt-get install'
	alias aptsearch='apt-cache search'
	;;
esac

if [[ -n $STY || -n $TMUX ]]; then
    function title() { print -Pn "\ek$1\e\\"}
    function precmd() { title "%20<..<%~%<<" }
    function preexec() { title "%20>..>$1%<<" }
    export PS1="%{${fg[cyan]}%}[%D{%H:%M} %20<..<%~%<<]%{$reset_color%} "
else
    export PS1="%{${fg[cyan]}%}[%D{%H:%M} %n@%m:%20<..<%~%<<]%{$reset_color%} "
fi

export PATH=~/usr/bin:$PATH
export LD_LIBRARY_PATH=~/usr/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=~/usr/lib:$LIBRARY_PATH
export MANPATH=~/usr/share/man:$MANPATH

export EDITOR=vim
