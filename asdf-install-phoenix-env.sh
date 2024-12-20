#!/bin/bash

if [ ! -d ~/.asdf ]
then
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.15.0
fi

. "$HOME/.asdf/asdf.sh"

if ! $(which java > /dev/null)
then
    . /etc/os-release

    if [ "$VERSION_CODENAME" = "noble" ] || [ "$UBUNTU_CODENAME" = "noble" ]
    then
        sudo apt-get -y install build-essential autoconf m4 libncurses5-dev \
             libwxgtk3.0-gtk3-dev libwxgtk-webview3.0-gtk3-dev libgl1-mesa-dev \
             libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop \
             libxml2-utils libncurses-dev default-jdk
    fi

    if [ "$VERSION_CODENAME" = "bookworm" ]
    then
        sudo apt-get -y install build-essential autoconf m4 libncurses5-dev \
             libpng-dev libssh-dev unixodbc-dev xsltproc fop \
             libxml2-utils libncurses-dev default-jdk
    fi
fi


asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest:22
asdf global nodejs latest:22

asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf install erlang latest:27
asdf global erlang latest:27

asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf install elixir 1.18.0-otp-27
asdf global elixir 1.18.0-otp-27

echo "Add the following to ~/.bashrc:"
echo
echo . "\$HOME/.asdf/asdf.sh"
echo . "\$HOME/.asdf/completions/asdf.bash"
