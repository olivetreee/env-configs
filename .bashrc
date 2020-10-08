# Load up alias dotfile
. ~/.alias

# Load any local configuration
[[ -f "$HOME/.profile" ]] && source "$HOME/.profile"

# To display the git branch on the prompt:
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Format prompt color
# \[ and \] are the start and end of non-printable char sequences
GREEN='\[\e[32m\]'
BLUE='\[\e[1;34m\]'
RED='\[\e[0;31m\]'
RESET='\[\e[0m\]'
export PS1="\u@$GREEN{\W}$BLUE\$(parse_git_branch)$RESET$ "

# Set up git author and commiter for change_author automated script
export GIT_COMMITTER_EMAIL='some.email@bla.com'
export GIT_AUTHOR_EMAIL='some.email@bla.com'
export GIT_COMMITTER_NAME='Me'
export GIT_AUTHOR_NAME='Me'

# adb command
export PATH=${PATH}:/path-to/adb-commands

# rbenv config
export PATH="$HOME/.rbenv/bin:$PATH"
  if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="/usr/local/bin:$PATH"
eval "$(rbenv init -)"

# Load extensions
source "$HOME/.git-completion.bash"
source "$HOME/.git-prompt.sh"
source "$HOME/.nvm/nvm.sh"

# Look for commands in these places
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="$HOME/.bin:$PATH"

# Initialize node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

# For Postgres
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
