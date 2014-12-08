filetype plugin indent on

call plug#begin('~/.vim/plugged')
let g:plug_timeout = 1000 " YCM is slooow

" Aesthetics
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'myusuf3/numbers.vim'
Plug 'luochen1990/rainbow'
Plug 'gorodinskiy/vim-coloresque'
Plug 'spolu/dwm.vim'

" General Programming
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
"Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
Plug 'kien/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'Raimondi/delimitMate'
Plug 'rking/ag.vim'
Plug 'tpope/vim-surround'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tomtom/tcomment_vim'

" Python & Web Dev
Plug 'davidhalter/jedi-vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'mattn/emmet-vim'
Plug 'ehamberg/vim-cute-python'
Plug 'alfredodeza/pytest.vim'
Plug 'jmcantrell/vim-virtualenv'

call plug#end()

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

" YCM
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_path_to_python_interpreter = '/bin/python'

" Jedi
" Want refactoring, navigation etc. features only
"let g:jedi#completions_enabled = 0

" Ctrlp
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0
nnoremap <Leader>f :CtrlPFunky<Cr>

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
set wildmode=list:full
set number
set numberwidth=5

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

" Font
set guifont=Source\ Code\ Pro\ 11

" Hide menu, toolbar, and scrollbar
set guioptions=
