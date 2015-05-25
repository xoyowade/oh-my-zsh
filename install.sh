# #!/bin/sh

if [ $# -lt 2 ]; then
    insdir=~/conf
    bakdir=~/.oldconf
else
    insdir=$1
    bakdir=$2
fi

# find a clean dir to backup
i=0
defdir=$bakdir
while [ -e $bakdir ]; do
    i=$(($i+1))
    bakdir="${defdir}.$i"
done
mkdir -p $bakdir

function backup {
    if [ -e ~/$1 ]; then
	mv -f ~/$1 $bakdir/
    else
	echo "try to rm $1 (unexisting file or broken link)"
	rm -rf ~/$1
    fi
}

function link {
    ln -s $insdir/$1 ~/$2
}

git=(.gitconfig .gitignore_global)
for fn in ${git[@]}
do
backup $fn
link git/$fn $fn
done

emacs=(.Xdefaults .emacs)
for fn in ${emacs[@]}
do
backup $fn
link emacs/$fn $fn
done
backup .emacshome
link emacs .emacshome

vim=(.vim .vimrc)
for fn in ${vim[@]}
do
backup $fn
link vim/$fn $fn
done

tmux=(.tmux.conf)
for fn in ${tmux[@]}
do
backup $fn
link tmux/$fn $fn
done

zsh=(.zshrc .zprofile .zshenv)
for fn in ${zsh[@]}
do
backup $fn
link shell/.oh-my-zsh/$fn $fn
done
touch ~/.conf.zsh
touch ~/conf.zsh $insdir/shell/.oh-my-zsh/custom/conf.zsh

shell=(.bashrc .oh-my-zsh)
for fn in ${shell[@]}
do
backup $fn
link shell/$fn $fn
done


echo "Finish installing. All old config files are moved to ${bakdir}"


