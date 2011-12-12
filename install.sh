#!/bin/sh
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
while [ -a $bakdir -o -e $bakdir ]; do
    i=$(($i+1))
    bakdir="${defdir}.$i"
done
mkdir -p $bakdir

function backup {
    if [ -a ~/$1 -o -e ~/$1 ]; then
	mv -f ~/$1 $bakdir/
    fi
}

function link {
    ln -s $insdir/$1 ~/$2
}

git=(.gitconfig .gitignore_global)
for fn in $git
do
backup $fn
link $fn $fn
done

emacs=(.Xdefaults .emacs)
for fn in $emacs
do
backup $fn
link emacs/$fn $fn
done
backup .emacshome
link emacs .emacshome

vim=(.vim .vimrc)
for fn in $vim
do
backup $fn
link vim/$fn $fn
done

zsh=(.zshrc .zprofile)
for fn in $zsh
do
backup $fn
link shell/.oh-my-zsh/$fn $fn
done

shell=(.bashrc)
for fn in $shell
do
backup $fn
link shell/$fn $fn
done

echo "Finish installing. All old config files are moved to ${bakdir}"


