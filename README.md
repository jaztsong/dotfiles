# dotfiles

###Install:
*git submodule update --init --recursive*
Compiling YCM with semantic support for C-family languages:

cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
Compiling YCM without semantic support for C-family languages:

cd ~/.vim/bundle/YouCompleteMe
./install.py

###Tmux(Recommended)
To get and build the latest from version control:

         git clone https://github.com/tmux/tmux.git
         cd tmux
         sh autogen.sh
         ./configure && make
* The latest version of *tmux* need latest *libevent*, so don't forget install the *libevent*.


####NOTE:
+ When install YCM, remember to run *git submodule update --init --recursive* first.
* *CMake* is required by YCM.
+ To make zsh as the default shell, type ```sudo chsh -s $(which zsh)```.
