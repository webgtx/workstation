export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="/usr/bin/vim"
export ZSH_THEME="clean"

plugins=(

  # Tools
  git
  ansible
  terraform
  gcloud
  python
  ruby
  kubectl
  minikube
  helm
  dnf
  docker

  # Clouds
  doctl
  aws
  azure

  # Usability
  vi-mode

)

source $ZSH/oh-my-zsh.sh

alias irssi="podman run -it --rm -v $HOME/.irssi:/home/user/.irssi:z -v /etc/localtime:/etc/localtime:ro irssi:alpine irssi"
alias rr=ranger
alias s=sudo

odir () {
  tmp=$(mktemp)
  ranger --choosedir=$tmp
  dir=$(cat $tmp)
  [ -d $dir ] && [ $dir != $PWD ] && cd $dir
}

bindkey -s "^o" "odir\n"
