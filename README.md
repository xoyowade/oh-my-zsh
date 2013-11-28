My configurations for everyday tools

## Pre-requisitions

TODO

## Install

With version 1.6.5 of Git or later:

    $ git clone --recursive git://github.com/xoyowade/conf.git $CONF_HOME
    $ cd $CONF_HOME
    $ zsh ./install.sh $CONF_HOME $BAK_DIR

For older Git versions, just use:

    $ git clone git://github.com/xoyowade/conf.git $CONF_HOME
    $ cd $CONF_HOME
    $ git submodule update --init
    $ zsh ./install.sh $CONF_HOME $BAK_DIR

install.sh will create some symbolic links to the configure files, and backup your old dot files in $BAK_DIR

### Component compilation

TODO

### Update

	$ git pull --recurse-submodules
	$ git submodule update --recursive
