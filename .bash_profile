export LC_ALL=en_US.UTF-8

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ -s "/Users/emarin/.gvm/scripts/gvm" ]] && source "/Users/emarin/.gvm/scripts/gvm"
# Go 
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin
source ~/.bashrc

#personal Scripts
export PATH=$PATH:/Users/emarin/quickStart
