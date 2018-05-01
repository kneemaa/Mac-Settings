#!/bin/bash


#install xcode command line tools (needed for brew)
echo "Make sure Xcode is installed and the terms and conditions has been accepted..."
read blank

clear
echo "Downloading desired Apps"
sleep 5

wget 'https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg'
wget 'https://download-installer.cdn.mozilla.net/pub/firefox/releases/59.0.2/mac/en-US/Firefox%2059.0.2.dmg'
wget 'https://download.scdn.co/SpotifyInstaller.zip'
wget 'http://lightheadsw.com/files/releases/com.lightheadsw.Caffeine/Caffeine1.1.1.zip'

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
                brew install awscli docker gettext icu4c libffi libunistring mtr node ossp-uuid pkg-config ruby task unrar wget berkeley-db docker-compose gmp libarchive libidn2 libyaml mysql nuttcp p11-kit popt readline snow telnet xz cmatrix docker-machine gnutls libdnet libmagic lua@5.1 nettle openssl packer pv tmux vim zstd cscope gdbm hping libevent libtasn1 macvim nmap perl python tree watch

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
        git clone https://github.com/smalldoorman/Response-Gifs.git $HOME/Response_Gifs
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
    echo "install powerline"
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    echo "Installing PowerLevel9k"
    git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
    cd $HOME/Mac-Settings
	# git clone git@github.com:powerline/powerline.git
	# rsync -av powerline/powerline /usr/local/lib/python2.7/site-packages/
	# rsync -av powerline/scripts /usr/local/lib/python2.7/site-packages/
        clear
        git clone https://github.com/smalldoorman/Mac-Settings.git $HOME/Mac-Settings
        cd $HOME/Mac-Settings
        cp .zshrc ~/.zshrc
        cp .vimrc ~/.vimrc
        cp Incon*/*.otf $HOME/Library/Fonts
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


clear
echo "[DONE]"
