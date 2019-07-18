export PATH=$PATH:~/
alias ngrok='/Users/emarin/ngrok'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# Go 
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin

# Configure virtualenv 
# https://www.andreagrandi.it/2018/12/19/installing-python-and-virtualenv-on-osx/
export WORKON_HOME=~/.virtualenvs
[ -f /usr/local/bin/virtualenvwrapper.sh ] && source /usr/local/bin/virtualenvwrapper.sh


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
