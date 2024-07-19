# eval $(/opt/homebrew/bin/brew shellenv)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/lsong/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/lsong/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/lsong/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/lsong/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

