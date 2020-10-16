#!/bin/bash

mkdir -p $HOME/kneemaa

#install xcode command line tools (needed for brew)
echo "Make sure Xcode is installed and the terms and conditions has been accepted..."
read blank

clear
echo "Downloading desired Apps"
sleep 5

wget 'https://download.scdn.co/SpotifyInstaller.zip'

clear
sleep 5

#install brew
read -r -p "Do you want to install Brew? [Y/N]" response
case $response in
    [yY][eE][sS]|[yY])
        echo "Installing Brew..."
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        clear
        sleep 5
        read -r -p "Do you want to install your Brew Packages? [Y/N]" answer
        case $answer in
            [yY][eE][sS]|[yY])
                echo "Installing Brew Packages..."
                brew install docker-compose jq git packer tfenv tmux tree wget vim watch
                clear
                ;;
            *)
                echo "Skipping Packages..."
                clear
                ;;
        esac
        ;;
    *)
        echo "Skipping Brew..."
        clear
        ;;
esac
clear

read -r -p "Would you like to download your Response Gifs now? [Y/N]" response
case $response in
    [yY][eE][sS]|[yY])
        git clone https://github.com/kneemaa/Response-Gifs.git $HOME/kneemaa/Response_Gifs
        ;;
    *)
        echo "Ok, not now..."
        ;;
esac

#turn off case sensitivity in terminal
echo "set completion-ignore-case On" >> ~/.inputrc

read -r -p "Would you like to setup your Terminal now? [Y/N]" response
case $response in
    [yY][eE][sS]|[yY])
      echo "installing zsh"
      sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
      echo "Installing Spaceship"
      git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
      ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme" 
      clear
      git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
      cd $HOME/Mac-Settings
      cp .zshrc ~/.zshrc
      cp .vimrc ~/.vimrc
      cp Incon*/*.otf $HOME/Library/Fonts
      vim +PluginInstall +qall
      open Solarized\ Dark.terminal
      sleep 2
      read -r -p "Please make 'Solarized Dark.terminal' the default profile then press Enter to continue..." key
      read -r -p "Please make 'Inconsolata' the default font then press Enter to continue..." key

      ;;
    *)
      echo "Maybe next time..."
      sleep 5
      ;;
esac

echo "[DONE]"
