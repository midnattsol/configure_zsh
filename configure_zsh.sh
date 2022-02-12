#!/bin/zsh

function linux_distro_installation()
{
  id_like=$(grep ID_LIKE /etc/os-release | cut -d\= -f2)
  case ${id_like} in
    debian)
      installation_package="apt install -y"
      ;;
    fedora)
      installation_package="dnf install -y"
      ;;
    arch)
      installation_package="pacman -S --noconfirm"
      ;;
    alpine)
      installation_package="apk add"
  esac
  echo ${installation_package}
}

function install_meslo_fonts()
{
  mkdir -p ${HOME}/.fonts
  curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -o ${HOME}/.fonts/MesloLGS-NF-Regular.ttf
  curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -o ${HOME}/.fonts/MesloLGS-NF-Bold.ttf
  curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -o ${HOME}/.fonts/MesloLGS-NF-Italic.ttf
  curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -o ${HOME}/.fonts/MesloLGS-NF-Bold-Italic.ttf
  fc-cache -v ${HOME}/.fonts
}



if [ ${OSTYPE:0:5} = "linux" ]; then
  install=$(linux_distro_installation)
  eval "sudo ${install} fzf git curl"
  install_meslo_fonts
elif [ ${OSTYPE:0:5} = "darwin" ]; then
  brew install fzf git curl
fi

  #Installing Oh My Zsh
  echo -e "n\nexit" | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  #Installing powerlevel10k
  git clone https://github.com/romkatv/powerlevel10k.git ${HOME}/.oh-my-zsh/themes/powerlevel10k

  #Installing Highlighting in ZSH commands
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${HOME}/.oh-my-zsh/plugins/zsh-syntax-highlighting

  # Configuring zshrc
  sed -iE 's:^ZSH_THEME=.*$:ZSH_THEME=powerlevel10k/powerlevel10k:g' ${HOME}/.zshrc
  sed -iE 's:^plugins=.*$:plugins=(git fzf zsh-syntax-highlighting kubectl z):g' ${HOME}/.zshrc

echo '
# Some Keys configuration
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char' >> ${HOME}/.zshrc