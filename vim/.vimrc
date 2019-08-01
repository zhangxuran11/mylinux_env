set encoding=utf-8
set fileencodings=utf-8,gb2312,gbk,gb18030m,cp936

"Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'
Plugin 'scrooloose/nerdtree'
call vundle#end()
filetype plugin indent on

"colorscheme solarized
"colorscheme molokai
set laststatus=2
set ruler
set nu
set cursorline
"set cursorcolumn
set hlsearch

"omnicppcomplete
set nocp
filetype plugin on
set completeopt=menu,menuone
let OmniCpp_MayCompleteDot=1
let OmniCpp_MayCompleteArrow=1
map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"set tags+=/home/liurongxue/projects/h9/CtrlCard/Middleware/MasterProcess/tags
map <F3> :TlistToggle<CR>
syntax enable
syntax on

filetype indent on
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

nmap <F2> :NERDTreeToggle<CR>
let NERDTreeWinSize=32
let NERTreeWinPos='left'

