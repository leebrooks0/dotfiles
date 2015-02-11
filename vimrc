"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
syntax on
filetype plugin indent on
let mapleader = ' '

set autoread                      " Autoread files when externally updated
set background=dark
set backspace=indent,eol,start    " Backspace like you would expect
set clipboard=unnamedplus         " Use the system clipboard for copy and paste
set encoding=utf-8
set history=200
set laststatus=2                  " Always show statusline
set mouse=a                       " Enable the mouse
set noswapfile
set nowrap
set nowritebackup
set number
set scrolloff=7                   " Lines above and below cursor when scrolling
set shell=/bin/bash
set splitbelow                    " Split windows like other editors
set splitright
set wildmenu
set wildmode=list:longest,full

" Indentation
set autoindent
set copyindent
set smartindent

" Searching
set hlsearch                        " Highlight all matches
set incsearch                       " Highlight in real time
set ignorecase
set smartcase                       " Ignore 'ignorecase' if uppercase present

" Tabs and spaces
set expandtab                       " Replace tabs with spaces
set shiftwidth=4                    " Number of spaces when indenting and dedenting
set tabstop=4                       " Spaces per tab
set shiftround                      " Round indent to multiples of shiftwidth

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'davidhalter/jedi-vim'
Plug 'ervandew/supertab'
Plug 'gorodinskiy/vim-coloresque'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'mattn/emmet-vim'
Plug 'myusuf3/numbers.vim'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tacahiroy/ctrlp-funky'
Plug 'tomasr/molokai'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Plugin Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Nerdtree
let NERDTreeIgnore=['__pycache__', '.git$', '\.pyc$']
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer=1

" Molokai
colorscheme molokai
let g:rehash256 = 1

" Ctrl-P
let g:ctrlp_extensions = ['buffertag']
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_funky_syntax_highlight = 1

" Emmet
let g:use_emmet_complete_tag = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ctrl P
nnoremap <leader>p :CtrlP<CR>
nnoremap <Leader>f :CtrlPFunky<CR>
nnoremap <Leader>b :CtrlPBufTag<CR>

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>

" Easy window movement
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
noremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l

" Easy window splitting
nnoremap <leader>s :vsplit<CR>
nnoremap <leader>hs :split<CR>

" Shift key is effort...
nnoremap ; :
vnoremap ; :

" Remove search highlights
nmap <leader>/ :nohlsearch<CR>

" Retain selection when indenting
vnoremap < <gv
vnoremap > >gv

" Toggle on and off NERDTree
noremap <leader>e :NERDTreeToggle<CR>
noremap <leader>ef :NERDTreeFind<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Rainbow parentheses
autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces

" Strip all whitespace on save
autocmd BufWrite * :%s/\s\+$//e

" Autoformat python code
autocmd BufWritePost *.py silent! !autopep8 --in-place %
