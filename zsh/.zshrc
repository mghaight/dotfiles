alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias ll="ls -lh -a -F -G"
alias ls="ls -G"

alias e="emacsclient -nw"
alias ec="emacsclient --create-frame &!"
alias em="emacs -nw"
alias vim="nvim"
alias vi="nvim"
alias v="nvim"

alias news="newsboat"

alias brewall="brew update && brew upgrade && brew upgrade --fetch-HEAD neovim && brew upgrade --cask --greedy && brew cleanup --prune=all"

alias todo="tmux rename-window 'todo' && vim ~/wiki/todo.md && tmux set-window-option automatic-rename on"

alias cat="bat --plain"
alias icat="kitten icat"

alias R="R --no-save --no-restore-data"

alias :q="exit"
alias :wq="exit"

autoload -z edit-command-line
zle -N edit-command-line
bindkey -M emacs '^X^E' edit-command-line

setopt interactive_comments
setopt CORRECT
setopt dot_glob
setopt extended_glob

# export variables
export PROMPT="%2~ $ "
export EDITOR="nvim"
export PATH="/Users/mgh/.local/bin:$PATH"
export PATH="$HOME/.config/emacs/bin:$PATH"
export PATH="$HOME/scripts:$PATH"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/mgh/.zshrc'

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' completer _expand_alias _complete _ignored
# End of lines added by compinstall
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/lib/ruby/gems/3.4.0/bin:$PATH"
