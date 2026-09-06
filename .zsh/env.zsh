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
# export TERM=xterm-256color
export LANG=en_US.UTF-8
export COLORTERM=truecolor
export K9S_CONFIG_DIR="/Users/kirill/.config/k9s"
export AWS_PROFILE_STATE_ENABLE=true
export KUBE_EDITOR=nvim
export EDITOR=nvim
export MANPAGER='nvim +Man!'

# history
HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#979797,fg+:#d0d0d0,bg:#121212,bg+:#262626
  --color=hl:#5f87af,hl+:#5fd7ff,info:#afaf87,marker:#87ff00
  --color=prompt:#d7005f,spinner:#af5fff,pointer:#af5fff,header:#87afaf
  --color=border:#262626,label:#aeaeae,query:#d9d9d9
  --border="rounded" --border-label="" --preview-window="border-rounded" --prompt="> "
  --marker=">" --pointer="*" --separator="─" --scrollbar="│"'
