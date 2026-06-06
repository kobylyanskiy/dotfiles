alias k=kubectl
alias v=nvim
alias d=docker
alias dc=docker-compose
alias vim=nvim
alias lzd=lazydocker
alias ls='ls --color'
alias vimdiff='nvim -d'
alias kdebug='echo "microdnf install -y iputils bind-utils curl" | tee >(pbcopy) && echo "(copied to clipboard)" && kubectl run debug-pod -n monitoring --rm -it --image=rockylinux:9-minimal --overrides="{\"spec\":{\"containers\":[{\"name\":\"debug-pod\",\"image\":\"rockylinux:9-minimal\",\"stdin\":true,\"tty\":true,\"resources\":{\"requests\":{\"cpu\":\"10m\",\"memory\":\"64Mi\"},\"limits\":{\"cpu\":\"100m\",\"memory\":\"256Mi\"}}}]}}"'
alias relogin='KUBECONFIG="fakefile" tsh logout && tsh --proxy=teleport.internal.corp.traderepublic.com:443 --auth okta login'
