# PATH
export DENO_INSTALL="/Users/kirill/.deno"
export PATH=$PATH:$(go env GOPATH)/bin
export PATH="$PATH:/Users/kirill/.local/bin"
export PATH="$DENO_INSTALL/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="$PATH:/Users/kirill/Documents/tr/infrastructure/bin"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="$HOME/.gem/ruby/3.4.0/bin:$PATH"
### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/kirill/.rd/bin:$PATH"

# general settings
export CLICOLOR=1
export TERM=xterm-256color
export LANG=en_US.UTF-8
export COLORTERM=truecolor
export K9S_CONFIG_DIR="/Users/kirill/.config/k9s"
export AWS_PROFILE_STATE_ENABLE=true
export KUBE_EDITOR=nvim
export EDITOR=nvim

# history
HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE
