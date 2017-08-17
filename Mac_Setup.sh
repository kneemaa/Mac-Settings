#!/bin/bash


#install xcode command line tools (needed for brew)
echo "Make sure Xcode is installed and the terms and conditions has been accepted..."
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
                brew install gdbm libtasn1 openssl readline unrar gmp libunistring p11-kit rename xz gnutls mtr pkg-config sqlite libdnet nettle task libffi nmap tree awscli gettext ossp-uuid tmux berkeley-db hping macvim rpm vim cscope libevent popt snow wget libmagic python Caskroom/cask/textwrangler 

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
        cd $HOME/Mac-Settings
	git clone git@github.com:powerline/powerline.git
	rsync -av powerline/powerline /usr/local/lib/python2.7/site-packages/
	rsync -av powerline/scripts /usr/local/lib/python2.7/site-packages/
        clear
        git clone https://github.com/smalldoorman/Mac-Settings.git $HOME/Mac-Settings
        cd $HOME/Mac-Settings
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
echo "[DONE]"
