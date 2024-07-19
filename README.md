# dotfiles

# Initialize and update submodules
```
git submodule update --init --recursive
```

# Loop through each submodule
```
git submodule foreach '
    # Fetch the default branch from the remote
    branch=$(git remote show origin | sed -n "/HEAD branch/s/.*: //p")

    # Checkout the default branch
    git checkout $branch

    # Pull the latest changes
    git pull origin $branch
'
```

All above can be executed by calling the `update_submodules.sh`

###Tmux(Recommended)
To get and build the latest from version control:

         git clone https://github.com/tmux/tmux.git
         cd tmux
         sh autogen.sh
         ./configure && make
* The latest version of *tmux* need latest *libevent*, so don't forget install the *libevent*.


####NOTE:
+ To make zsh as the default shell, type ```sudo chsh -s $(which zsh)```.
