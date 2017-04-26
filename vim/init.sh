#! /bin/bash

cp vimrc ~/.vimrc
mkdir -p ~/.vim/{bundles,snippet,skelton,rc}
cp ./dein.toml ~/.vim/rc/dein.toml
cp ./dein_lazy.toml ~/.vim/rc/dein_lazy.toml
cp ./skelton/skel.py ~/.vim/skelton/skel.py

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.vim/bundles
