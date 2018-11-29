# dotfiles

###Install:
`git submodule update --init --recursive`


###Tmux(Recommended)
To get and build the latest from version control:

         git clone https://github.com/tmux/tmux.git
         cd tmux
         sh autogen.sh
         ./configure && make
* The latest version of *tmux* need latest *libevent*, so don't forget install the *libevent*.


####NOTE:
+ To make zsh as the default shell, type ```sudo chsh -s $(which zsh)```.
