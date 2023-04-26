set nocompatible              " be iMproved, required
call plug#begin('~/.vim/plugged')
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'
"Plug 'rust-lang/rust.vim'
Plug 'vim-scripts/indentpython.vim'
"Plug 'glench/vim-jinja2-syntax'
"Plug 'posva/vim-vue'
Plug 'lifepillar/vim-solarized8'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
"Plug 'LnL7/vim-nix'
"Plug 'cespare/vim-toml'
"Plug 'hashivim/vim-terraform'
" Intellisense engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
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
set softtabstop=4
set expandtab
set fileformat=unix
set autoread

"set ai "Auto indent
"set si "Smart indent

set laststatus=2
set number relativenumber

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

" spelling on markdown files
autocmd BufRead,BufNewFile *.md setlocal spell

" no alert
set novisualbell
set noerrorbells
" no --INSERT -- since we alreayd have powerline
set noshowmode

set background=light
colorscheme solarized8

let g:solarized_termcolors=256

let g:lightline = {'colorscheme': 'solarized',}


" Configure gutter shortcut
map <F10> <Plug>GitGutterNextHunk
map <F9> <Plug>GitGutterPrevHunk
nmap <leader>s <Plug>GitGutterStageHunk
nmap <leader>u <Plug>GitGutterUndoHunk
nmap <leader>p <Plug>GitGutterPreviewHunk

set mouse=a


" Neat X clipboard integration
" ,p will paste clipboard into buffer
" ,c will copy entire buffer into clipboard
noremap <leader>p :read !xsel --clipboard --output<cr>
noremap <leader>c :w !xsel -ib<cr><cr>


" trigger `autoread` when files changes on disk
set autoread
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" notification after file change
autocmd FileChangedShellPost *
        \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
