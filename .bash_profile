export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
-e 
[[ -s "/Users/emarin/.gvm/scripts/gvm" ]] && source "/Users/emarin/.gvm/scripts/gvm"
# Go 
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin
source ~/.bashrc

#personal Scripts
export PATH=$PATH:/Users/emarin/quickStart
