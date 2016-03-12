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

# Customize to your needs...
ZSH_CUSTOM=$ZSH/custom
source $ZSH/oh-my-zsh.sh

# Common config

# setup paths
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./
OPT_HOME=$HOME/usr/local
export PATH=$OPT_HOME/bin:$HOME/utils/bin:$PATH
export LD_LIBRARY_PATH=$OPT_HOME/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=$OPT_HOME/lib:$LIBRARY_PATH
export MANPATH=$OPT_HOME/share/man:$MANPATH
export C_INCLUDE_PATH=$OPT_HOME/include:$C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=$OPT_HOME/include:$CPLUS_INCLUDE_PATH
export PYTHONPATH=$OPT_HOME/python:$PYTHONPATH

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

# growl notification for long waiting command
GROWL_HOST_CONF=$HOME/.growl_host
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
                # get latest growl host ip
                GROWL_HOST=`cat $GROWL_HOST_CONF`
                [[ "$GROWL_HOST" = "" ]] && GROWL_HOST="`echo $SSH_CLIENT | cut -f1 -d' '`"
                CMD_INFO="Success!"
                [[ $PREEXEC_CMD_STATUS -ne 0 ]] && CMD_INFO="Failed :(" 
	            growlnotify -H $GROWL_HOST -t "$CMD_INFO" -m "[${PREEXEC_CMD}] took $elapsed secs"> /dev/null 2>&1
            fi
	    fi
    }
    function growl_preexec () {
        export PREEXEC_CMD_STATUS=$?
	    export PREEXEC_TIME=$(date +'%s')
	    export PREEXEC_CMD="$1"

	    cmd=${(z)1[(w)0]}
	    if [[ $cmd == "sudo" ]]; then
            cmd=${(z)1[(w)2]}
	    fi

	    # ignore these commands
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

# ssh-agent
AGENT_SSH=$HOME/.agent.sh
test=`ps ux | grep ssh-agent | grep -v grep | awk '{print $2}' | xargs`

if [ "$test" = "" ]; then
   # there is no agent running
   if [ -e "${AGENT_SSH}" ]; then
      # remove the old file
      rm -f ${AGENT_SSH}
   fi;
   # start a new agent
   ssh-agent -s | grep -v echo >&${AGENT_SSH}
fi;

test -e ${AGENT_SSH} && source ${AGENT_SSH}

alias kagent="kill -9 $SSH_AGENT_PID"

# shell
alias l='ls -l'
alias lla='ls -la'
alias cdc='cd `pwd`'
alias utf8='iconv -f gbk -t UTF-8 '
# code 
alias grepr='grep -R'
alias grepcode='nocorrect grepcode'
alias rake='noglob rake'
alias emacsopen='emacsclient -n -a vim'
# git
alias gc='git ci -am'
alias gs='git status'
# svn
alias svn='nocorrect svn'
alias svnhist='svn log -v -l 3'
alias svnaddall='svn status | grep "?" | sed "s/^.* /svn add /" | bash'
# alias svnreset='svn revert . -R && svn status | awk '/^?/{$1 = "rm -rf"; print $0}'
# tools
alias asm='objdump -D -j .text'
alias nmc='nm -C'
alias hdc='hexdump -C'
alias m='make -j4'
alias rsyncr='rsync -r --progress --compress --stats'
alias chmodr='chmod a+rwX -R'

function mkc() { mkdir "$@" && cd "$_"; }

function rmq() { rm -rf $@ & }

function grepcode {
	dir=$2
	find -L $dir -path '*/.svn' -prune -o -type f -print | grep -v "cscope" | grep -v "CMakeFiles" | xargs grep -Ine $1
}

function swap() {
  tmpfile=$(mktemp -u $(dirname "$file1")/XXXXXX)
  mv "$1" "$tmpfile"
  mv "$2" "$1"
  mv "$tmpfile" "$2"
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
	if [[ -n $STY || -n $TMUX ]]; then
    	function title() { print -Pn "\ek$1\e\\"}
    	function precmd() { title "%20<..<%~%<<" }
    	function preexec() { title "%20>..>$1%<<" }
    	#export PS1="%{${fg[cyan]}%}[%D{%H:%M} %20<..<%~%<<]%{$reset_color%} "
	else
	    #export PS1="%{${fg[cyan]}%}[%D{%H:%M} %n@%m:%20<..<%~%<<]%{$reset_color%} "
	fi
	;;
esac

export EDITOR=vim

export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

unsetopt nomatch

# ASCII colors
RCol='\e[0m'    # Text Reset
# Regular           Bold                Underline           High Intensity      BoldHigh Intens     Background          High Intensity Backgrounds
Bla='\e[0;30m';     BBla='\e[1;30m';    UBla='\e[4;30m';    IBla='\e[0;90m';    BIBla='\e[1;90m';   On_Bla='\e[40m';    On_IBla='\e[0;100m';
Red='\e[0;31m';     BRed='\e[1;31m';    URed='\e[4;31m';    IRed='\e[0;91m';    BIRed='\e[1;91m';   On_Red='\e[41m';    On_IRed='\e[0;101m';
Gre='\e[0;32m';     BGre='\e[1;32m';    UGre='\e[4;32m';    IGre='\e[0;92m';    BIGre='\e[1;92m';   On_Gre='\e[42m';    On_IGre='\e[0;102m';
Yel='\e[0;33m';     BYel='\e[1;33m';    UYel='\e[4;33m';    IYel='\e[0;93m';    BIYel='\e[1;93m';   On_Yel='\e[43m';    On_IYel='\e[0;103m';
Blu='\e[0;34m';     BBlu='\e[1;34m';    UBlu='\e[4;34m';    IBlu='\e[0;94m';    BIBlu='\e[1;94m';   On_Blu='\e[44m';    On_IBlu='\e[0;104m';
Pur='\e[0;35m';     BPur='\e[1;35m';    UPur='\e[4;35m';    IPur='\e[0;95m';    BIPur='\e[1;95m';   On_Pur='\e[45m';    On_IPur='\e[0;105m';
Cya='\e[0;36m';     BCya='\e[1;36m';    UCya='\e[4;36m';    ICya='\e[0;96m';    BICya='\e[1;96m';   On_Cya='\e[46m';    On_ICya='\e[0;106m';
Whi='\e[0;37m';     BWhi='\e[1;37m';    UWhi='\e[4;37m';    IWhi='\e[0;97m';    BIWhi='\e[1;97m';   On_Whi='\e[47m';    On_IWhi='\e[0;107m';

source ~/.conf.zsh
