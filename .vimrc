"set background=dark
"let Solarized Dark=256
""Solarized Dark

filetype plugin indent on
syntax on

source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
set laststatus=2

set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

if has("gui_running")
       let s:uname = system("uname")
          if s:uname == "Darwin\n"
                    set guifont=Inconsolata\ for\ Powerline:h15
                       endif
                   endif
