filetype plugin indent on

let mapleader=" "

call plug#begin('~/.vim/plugged')

" Aesthetics
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'myusuf3/numbers.vim'
Plug 'luochen1990/rainbow'
Plug 'gorodinskiy/vim-coloresque'

" General Programming
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'kien/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'Raimondi/delimitMate'
Plug 'rking/ag.vim'
Plug 'tpope/vim-surround'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tomtom/tcomment_vim'
Plug 'vim-scripts/vim-auto-save'

" Python & Web Dev
Plug 'davidhalter/jedi-vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'mattn/emmet-vim'
Plug 'alfredodeza/pytest.vim'

call plug#end()

let g:auto_save = 1

let NERDTreeIgnore=['__pycache__', '.git']
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer=1

" Gruvbox
set background=dark
colorscheme gruvbox

" Rainbow
let g:rainbow_active = 1
" Disable for html
let g:rainbow_conf = {
\   'separately': {
\       'html': 0
\   }
\}

" Ctrlp
let g:ctrlp_extensions = ['buffertag']
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0
nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>f :CtrlPFunky<CR>
nnoremap <Leader>t :CtrlPBufTag<CR>

" Emmet
let g:use_emmet_complete_tag = 1

" General settings
syntax on
set shell=/bin/bash
set backspace=indent,eol,start
set cursorline
set encoding=utf-8
set history=200
set laststatus=2
set nowrap
set ruler
set wildmenu
set wildmode=list:longest,full
set number
set numberwidth=5
set nobackup
set noswapfile

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
nnoremap <esc> :nohlsearch<return><esc>

" Font
set guifont=Source\ Code\ Pro\ 11

" Hide menu, toolbar, and scrollbar
set guioptions=

" Quicker window movement
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l

" Easier window splitting
nnoremap <leader>s :vsplit<CR>
nnoremap <leader>hs :split<CR>
