# omz
export ZSH="$HOME/.oh-my-zsh"
HYPHEN_INSENSITIVE="true"
source $ZSH/oh-my-zsh.sh

# custom prompt
PROMPT='%{$fg[cyan]%}%~ '
PROMPT+='$(git_prompt_info)'
PROMPT+='%{$fg[blue]%}> '
PROMPT+='%{$reset_color%}'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}[%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}]%{$reset_color%} "

# enable fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# homebrew on M1
HOMEBREW_DIR="/opt/homebrew"

# enable zsh highlighting
source $HOMEBREW_DIR/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH=$PATH:$HOMEBREW_DIR/bin:$HOMEBREW_DIR/sbin

# stop checking homebrew update automatically
# export HOMEBREW_NO_AUTO_UPDATE=1

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

export EDITOR="nvim"
alias v="nvim"
alias vim="nvim"

alias c="code"
alias ci="code-insiders"

# git alias
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gco="git checkout"
alias gb="git branch"
alias gl="git log"
alias gd="git diff"

alias python="python3"
alias pip="pip3"

alias m="make"
alias b="bazel"

# quickly modify zsh and neovim configs
alias zc="vim ~/.zshrc && source ~/.zshrc"
alias vc="vim ~/.config/nvim/init.vim"
