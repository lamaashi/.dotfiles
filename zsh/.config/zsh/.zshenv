export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DATA_HOME="$HOME/.local/share"

export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GOPATH="$XDG_DATA_HOME"/go
export GOBIN="$GOPATH"/bin
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages
export NVM_DIR="$XDG_DATA_HOME"/nvm
export AZURE_CONFIG_DIR="$XDG_DATA_HOME"/azure
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc"
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export ZAUTOJUMP="$XDG_DATA_HOME/autojump/autojump.txt "
export POETRY_HOME="$XDG_DATA_HOME/poetry"
export TF_CLI_CONFIG_FILE="$XDG_CONFIG_HOME/terraform/.terraformrc"
export DOTNET_ROOT=/opt/dotnet
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export CARGO_TARGET_DIR="$XDG_DATA_HOME/cargo_target"

export FZF_DEFAULT_OPTS='-i --height=50%'
export DOTFILES="$HOME/.dotfiles"
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZPLUG_HOME="$XDG_DATA_HOME"/zplug
export WORKRC="$HOME/.config/zsh/work.zsh"

export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file


## ENVIRONEMENT VARIALES
export SWAYSOCK=/run/user/$(id -u)/sway-ipc.$(id -u).$(pgrep -x sway).sock
export EDITOR=nvim
export VISUAL=nvim


export PATH="$PATH:/home/$USER/.local/bin"
export PATH="$PATH:/opt/mssql-tools18/bin"
export PATH="$PATH:$HOME/.local/share/cargo/bin"
export PATH=$HOME/bin:/usr/local/bin:$PATH:$HOME/.local/share/nvim/mason/bin/:$XDG_DATA_HOME/zplug/bin/:$HOME/.local/share/cargo/bin/:/usr/local/go/bin/:

