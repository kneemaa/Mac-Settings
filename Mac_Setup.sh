#!/bin/bash


#install xcode command line tools (needed for brew)
echo "Installing Xcode Command Line Tools\n Press enter to continue..."
xcode-select --install
read blank

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
                brew install gdbm libtasn1 openssl readline unrar gmp libunistring p11-kit rename xz gnutls mtr pkg-config sqlite libdnet nettle task libffi nmap python3 tree awscli gettext ossp-uuid tmux berkeley-db hping macvim rpm vim cscope libevent popt snow wget libmagic python Caskroom/cask/textwrangler 

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

read -r -p "Would you like to setup your Terminal now? [Y/N]" response
case $response in
    [yY][eE][sS]|[yY])
        echo "install powerline"
        brew install git+git://github.com/Lokaltog/powerline
        clear
        git clone https://github.com/smalldoorman/Mac-Settings.git $HOME/Mac_Settings
        cd $HOME/Mac_Settings
        cp .zshrc ~/.zshrc
        cp .vimrc ~/.vimrc
        cp Incon*/*.otf $HOME/Library/Fonts
        sleep 2
        read -r -p "Please add 'Solarized Dark.terminal' then press Enter to continue..." key

        ;;
    *)
        echo "Maybe next time..."
        sleep 5
        ;;
esac
clear

read -r -p "Would you like to download your Response Gifs now? [Y/N]" response
case $response in
    [yY][eE][sS]|[yY])
        git clone https://github.com/smalldoorman/Response-Gifs.git $HOME/Response_Gifs
        ;;
    *)
        echo "Ok, not now..."
        ;;
esac

#turn off case sensitivity in terminal
echo "set completion-ignore-case On" >> ~/.inputrc

clear
echo "\n [DONE]\n"
