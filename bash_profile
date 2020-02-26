[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
PATH=/usr/local/pgsql/bin:$PATH
export PATH

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

RED='\[\033[0;31m\]'
YELLOW='\[\033[0;33m\]'
GREEN='\[\033[0;32m\]'
CYAN='\[\033[0;36m\]'
LIGHT_BLUE='\[\033[0;94m\]'
LIGHT_GRAY='\[\033[1;37m\]'
NO_COLOR='\[\033[0m\]'

export PS1="$CYAN\u:[\W]$LIGHT_GRAY\$(parse_git_branch)$CYAN\$ $NO_COLOR"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export PATH="$PATH:/opt/yarn-[version]/bin"
export PATH="$PATH:`yarn global bin`"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export NODE_EXTRA_CA_CERTS="$(mkcert -CAROOT)/rootCA.pem"
export EDITOR="nvim"

# Auto complete git branches
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Enable italics in Tmux
# https://medium.com/@dubistkomisch/how-to-actually-get-italics-and-true-colour-to-work-in-iterm-tmux-vim-9ebe55ebc2be
export TERM=xterm-256color-italic
alias ssh='TERM=xterm-256color ssh'
