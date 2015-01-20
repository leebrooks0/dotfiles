set nocompatible

filetype plugin indent on
syntax on

let mapleader=" "

call plug#begin('~/.vim/plugged')

" Aesthetics
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'myusuf3/numbers.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'gorodinskiy/vim-coloresque'

" General Programming
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'jiangmiao/auto-pairs'
Plug 'rking/ag.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/vim-auto-save'
Plug 'ervandew/supertab'

" Python & Web Dev
Plug 'davidhalter/jedi-vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'mattn/emmet-vim'
Plug 'alfredodeza/pytest.vim'

call plug#end()

let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1

" Strip all whitespace on save
autocmd BufWrite * :%s/\s\+$//e

autocmd vimenter * NERDTree
let NERDTreeIgnore=['__pycache__', '.git']
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer=1

" Gruvbox
set background=dark
colorscheme gruvbox
if !has("gui_running")
   let g:gruvbox_italic=0
endif

let g:ctrlp_extensions = ['buffertag']
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_funky_syntax_highlight = 1
nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>f :CtrlPFunky<CR>
nnoremap <Leader>t :CtrlPBufTag<CR>

" Emmet
let g:use_emmet_complete_tag = 1

" General settings
set autoread
set shell=/bin/bash
set backspace=indent,eol,start
set clipboard=unnamedplus
set encoding=utf-8
set history=200
set laststatus=2
set nowrap
set ruler
set wildmenu
set wildmode=list:full
set number
set nobackup
set noswapfile
set scrolloff=7

" Indentation
set autoindent
set smartindent

" Use spaces, not tabs
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

nnoremap ; :
nmap <leader>/ :nohlsearch<CR>

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>

nnoremap <leader>q :bd<CR> " Quickly close the current buffer

nnoremap <silent> <leader>ev :e ~/.vimrc<CR>
" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source %

" Quickly get out of insert mode without your fingers having to leave the
" home row (either use 'jj' or 'jk')
inoremap jj <Esc>

" Font
set guifont=Source\ Code\ Pro\ 11

" Hide menu, toolbar, and scrollbar
set guioptions=

" Quicker window movement
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
noremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l

" Easier window splitting
nnoremap <leader>s :vsplit<CR>
nnoremap <leader>hs :split<CR>

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

autocmd BufWritePost *.py silent !autopep8 --in-place --aggressive %
