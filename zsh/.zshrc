# PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Masterpassword
export MPW_FULLNAME="Hinrek Saar"

# The following lines were added by compinstall

#zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/Users/hinrek/.zshrc'
zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES

autoload -Uz compinit promptinit colors
compinit
promptinit
colors

# Listcolors -ls
export CLICOLOR=YES

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
    # For linux
fi

# Default editor
export EDITOR="/usr/local/bin/vim"
export VISUAL="/usr/local/bin/vim"
