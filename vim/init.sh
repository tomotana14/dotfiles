#! /bin/bash

cp vimrc ~/.vimrc
mkdir -p ~/.vim/bundles
mkdir ~/.vim/rc
cp ./dein.toml ~/.vim/rc/dein.toml

#install dein.vim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.vim/bundles
