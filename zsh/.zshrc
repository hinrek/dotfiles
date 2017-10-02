# PATH
if [[ "$OSTYPE" == "darwin"* ]]; then
    export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    #
    # Dont change this in Arch Linux
    # Look into ~/.zprofile
    #
fi

# Masterpassword
export MPW_FULLNAME="Hinrek Saar"

# To unfreeze the terminal
ttyctl -f

#zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/Users/hinrek/.zshrc'
# For autocompletion with an arrow-key driven interface
zstyle ':completion:*' menu select
# Rehash for new stuff in PATH
zstyle ':completion:*' rehash true
# For autocompletion of command line switches for aliases
setopt COMPLETE_ALIASES

autoload -Uz compinit promptinit colors
compinit
promptinit
colors

# Listcolors -ls
export CLICOLOR=YES

# Aliases
alias ls='ls --color=auto --group-directories-first'

# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install

# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

# This will set the default prompt to the walters theme
prompt walters

# for base16
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# For ZSH syntax highlighting
if [[ "$OSTYPE" == "darwin"* ]]; then
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Default editor
if [[ "$OSTYPE" == "darwin"* ]]; then
    export EDITOR="/usr/local/bin/vim"
    export VISUAL="/usr/local/bin/vim"
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    export EDITOR="vim"
    export VISUAL="vim"
fi
