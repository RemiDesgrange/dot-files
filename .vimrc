set nocompatible              " be iMproved, required
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rust-lang/rust.vim'
" install before : `python3 -m pip install pynvim`
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'zchee/deoplete-clang'
Plug 'vim-scripts/indentpython.vim'
Plug 'glench/vim-jinja2-syntax'
Plug 'scrooloose/syntastic'
Plug 'posva/vim-vue'
Plug 'lifepillar/vim-solarized8'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()


if !has('nvim')
    set t_Co=256
    set term=xterm-256color
endif
set termencoding=utf-8
set encoding=utf8

syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set expandtab
set fileformat=unix

" Linebreak on 500 characters
set lbr
set tw=100

set ai "Auto indent
set si "Smart indent

set laststatus=2
set nu

" list of invisble chars to display
set listchars=nbsp:¬,trail:•,tab:>-
set list! "You see these breakpaces ?


" web dev
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

au BufNewFile,BufRead *.es6 set filetype=javascript
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" python dev
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |

au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

autocmd BufRead,BufNewFile *.md setlocal spell

" no alert
set novisualbell
set noerrorbells

set background=light
colorscheme solarized8

" start deoplete
let g:deoplete#enable_at_startup = 1

let g:solarized_termcolors=256


" airline is like powerline but wiothout all the boring stuff
let g:airline_powerline_fonts = 1

" python venv so I don't need to polute my system python
" need to create a venv for that. I'm using pew to create the venv
let g:python_host_prog = '/home/remi/.local/share/virtualenvs/vim_python2/bin/python2'
let g:python3_host_prog = '/home/remi/.local/share/virtualenvs/vim_python3/bin/python'

let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'


" nerdtree.
autocmd vimenter * NERDTree | wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" Configure gutter shortcut
map <F10> <Plug>GitGutterNextHunk
map <F9> <Plug>GitGutterPrevHunk
nmap <leader>s <Plug>GitGutterStageHunk
nmap <leader>u <Plug>GitGutterUndoHunk
nmap <leader>p <Plug>GitGutterPreviewHunk
