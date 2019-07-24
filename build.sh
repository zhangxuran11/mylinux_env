#!/bin/sh
if [ ! -d plugin ];then
    mkdir plugin
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

if [ ! -f plugin/cscope_maps.vim ];then
    pushd plugin
    wget http://cscope.sourceforge.net/cscope_maps.vim
    popd
else
    md5=`md5sum plugin/cscope_maps.vim | awk '{ print $1 }'`
    if [ $md5 != 'bd4d185d56d42965b920123b0e1ee779' ];then
        rm plugin/cscope_maps.vim
        pushd plugin
        wget http://cscope.sourceforge.net/cscope_maps.vim
        popd
    fi
fi

cp plugin ~/.vim/ -rfd
