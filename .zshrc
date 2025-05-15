# INSTRUCTIONS
# 1. Add ~/.alias (and ~/.alias-zsh as needed)
# 2. Install Powerlevel10k: https://github.com/romkatv/powerlevel10k#homebrew

# Set zsh configs
setopt PROMPT_SUBST  # This is so functions are eval within prompt config (export PS1 below)

# Load up alias dotfile
. ~/.alias
. ~/.alias-zsh

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%b'

# This is needed so I can iterate over newlines in a for loop (https://stackoverflow.com/questions/23157613/how-to-iterate-through-string-one-word-at-a-time-in-zsh)
setopt shwordsplit

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Powerlevel10k Overrides
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_last

# Init Powerlevel10k theme
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# Start at the repos folder
repos

# DISABLED COMMANDS. Reenable as needed.
# Load any local configuration
# [[ -f "$HOME/.profile" ]] && source "$HOME/.profile"

# To display the git branch on the prompt:
# parse_git_branch() {
#     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
# }

# Format prompt color
# As per https://www.rockhoppertech.com/blog/zsh-using-color/
# export PS1="%n@%F{green}{%1d}%F{magenta}$(parse_git_branch)%k%f"

# Set up the prompt (with git branch name)
# setopt PROMPT_SUBST
# PROMPT='%n@${GREEN}{%1d}${MAGENTA}(${vcs_info_msg_0_})${RESET}$ '

# Set up git author and commiter for change_author automated script
# export GIT_COMMITTER_EMAIL='some.email@bla.com'
# export GIT_AUTHOR_EMAIL='some.email@bla.com'
# export GIT_COMMITTER_NAME='Me'
# export GIT_AUTHOR_NAME='Me'

# Load extensions
# source "$HOME/.git-completion.bash"
# source "$HOME/.git-prompt.sh"
# source "$HOME/.nvm/nvm.sh"

# Look for commands in these places
# export PATH="$HOME/.bin:$PATH"

# Initialize node version manager
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
