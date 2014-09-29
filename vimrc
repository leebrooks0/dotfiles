
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'Raimondi/delimitMate'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'mattn/emmet-vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'scrooloose/syntastic'
Plugin 'spolu/dwm.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'rking/ag.vim'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'Glench/Vim-Jinja2-Syntax'

call vundle#end()
filetype plugin indent on

" Plugin configuration
" Solarized
set background=dark
colorscheme solarized

" Airline
let g:airline#extensions#tabline#enabled=1

" Rainbow Parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Ctrlp
let g:ctrlp_by_filename = 1

" Emmet
let g:use_emmet_complete_tag = 1

" Syntastic
let g:syntastic_auto_loc_list = 1

" General settings
syntax on
set autoread
set backspace=indent,eol,start
set cursorline
set encoding=utf-8
set history=1000
set laststatus=2
set nowrap
set ruler
set wildmenu
set wildmode=list:full

" Show line numbers
set relativenumber
set numberwidth=5

" Lines must be less than 80 chars
set textwidth=79
set colorcolumn=+1

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
nnoremap <esc> :nohlsearch<return><esc>

" Natural window splitting
set splitbelow
set splitright

" Disable Vim backups
set noswapfile
set nowritebackup

" Font
set guifont=Source\ Code\ Pro\ 10

" Hide menu, toolbar, and scrollbar
set guioptions-=m  "menu bar
set guioptions-=T  "toolbar
set guioptions-=r  "scrollbar

