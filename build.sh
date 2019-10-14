#!/bin/bash
if [ ! -d vim/plugin ];then
    mkdir vim/plugin -p
fi
which vim > /dev/null
if [ $? == 1 ];then
    echo Install vim ...
    sudo apt install vim
fi

which cscope > /dev/null
if [ $? == 1 ];then
    echo Install cscope ...
    sudo apt install cscope
fi


which ctags > /dev/null
if [ $? == 1 ];then
    echo Install ctags ...
    sudo apt install ctags
fi

cmake > /dev/null 2>&1
if [ $? == 127 ];then
    sudo apt install cmake
fi

if [ ! -f vim/plugin/cscope_maps.vim ];then
    pushd vim/plugin
    wget http://cscope.sourceforge.net/cscope_maps.vim
    popd
else
    md5=`md5sum plugin/cscope_maps.vim | awk '{ print $1 }'`
    if [ $md5 != 'bd4d185d56d42965b920123b0e1ee779' ];then
        rm vim/plugin/cscope_maps.vim
        pushd vim/plugin
        wget http://cscope.sourceforge.net/cscope_maps.vim
        popd
    fi
fi

if [ ! -d ~/.vim/plugin ];then
    mkdir ~/.vim/plugin -p
fi

cp vim/* ~/.vim/ -rfd

pushd Package
if [ ! -d vimcdoc-2.1.0 ];then
    tar xvf vimcdoc-2.1.0.tar.gz 
fi
pushd vimcdoc-2.1.0
cp doc plugin syntax ~/.vim/ -rfd
popd
if [ ! -d taglist ];then
    unzip taglist_46.zip -d taglist
fi
pushd taglist
cp doc plugin ~/.vim/ -rfd
popd

if [ ! -d winmanager ];then
    unzip winmanager-2.3.zip -d winmanager
fi
pushd winmanager
cp doc plugin ~/.vim/ -rfd
popd

popd

grep ctags+ ~/.profile
if [ $? == 1 ];then
echo "alias ctags+='ctags --c++-kinds=+p --fields=+iaS --extra=+q -R'" >> ~/.profile
fi

cp README_vim ~/
