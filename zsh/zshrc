#------------------------------------------------
# Path
#------------------------------------------------

if [[ "$OSTYPE" == "darwin"* ]]; then
    # For Brew Go
    export GOPATH=$HOME/go
    export GOROOT=/usr/local/opt/go/libexec
    export PATH=$PATH:$GOPATH/bin
    export PATH=$PATH:$GOROOT/bin
    # Homebrew token, look in file ~/.brew_git_token
    [ -f .brew_git_token ] && source .brew_git_token
    #
    # Littlebit nasty fix
    # Try to add all from /etc/paths.d to Path, because /etc/profile not working (brew ffs)
    #
    if [ -x /usr/libexec/path_helper ]; then
        eval `/usr/libexec/path_helper -s`
    fi
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    #
    # Dont change this in Arch Linux
    # Look into ~/.zprofile
    #
fi

#------------------------------------------------
# Masterpassword
#------------------------------------------------

# export MPW_FULLNAME="" from ~/.mpwrc
[ -f .mpwrc ] && source .mpwrc

#------------------------------------------------
# Load User Functions
#------------------------------------------------

# Functions should be placed in ~/functions dir and in seperate files
fpath=(~/functions $fpath)
autoload mpw

#------------------------------------------------
# Platform-specific Configuration
#------------------------------------------------

# Set $COLORTERM to truecolor for Iterm2
if [[ "$TERM_PROGRAM" == "iTerm.app" || "$TERM_PROGRAM" == "Hyper" ]]; then
    export COLORTERM=truecolor
fi

# Set 256 color and $COLORTERM to truecolor for mate-terminal
if [[ "$COLORTERM" == "mate-terminal" ]]; then
    export TERM=xterm-256color
    export COLORTERM=truecolor
fi

# Set 256 color if this is an XFCE Terminal
if [[ "$COLORTERM" == "xfce4-terminal" ]]; then
    export TERM=xterm-256color
fi

#------------------------------------------------
# Check Color Support
#------------------------------------------------

case "$TERM" in
    xterm-color|xterm-256color)
        color_prompt=yes
        ;;
esac

#------------------------------------------------
# Basic zsh settings
#------------------------------------------------

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

# autoload -Uz compinit promptinit colors
autoload -Uz compinit compinit -i promptinit colors bashcompinit
compinit
promptinit
colors
bashcompinit

# Aliases
if [[ "$OSTYPE" == "darwin"* ]]; then
    # You need to install 'brew install coreutils' for it to work
    alias ls='gls --color=auto --group-directories-first'
    alias ll='gls -all --color=auto --group-directories-first'
    alias reload='source ~/.zshrc'
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    alias ls='ls --color=auto --group-directories-first'
    alias reload='source ~/.zshrc'
fi

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
fpath=(/usr/local/share/zsh/site-functions $fpath)
fpath=(~/.zsh/completion $fpath)
rm -f ~/.zcompdump; compinit; bashcompinit

# This will set the default prompt to the walters theme
prompt walters

#------------------------------------------------
# Base16 Shell
#------------------------------------------------

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

#------------------------------------------------
# For ZSH syntax highlighting
#------------------------------------------------

if [[ "$OSTYPE" == "darwin"* ]]; then
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

#------------------------------------------------
# Default editor
#------------------------------------------------

if [[ "$OSTYPE" == "darwin"* ]]; then
    export EDITOR="/usr/local/bin/vim"
    export VISUAL="/usr/local/bin/vim"
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    export EDITOR="vim"
    export VISUAL="vim"
fi
