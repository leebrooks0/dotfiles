""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
set colorcolumn=+0
set cursorline
set encoding=utf-8
set foldmethod=syntax
set history=200
set laststatus=2                  " Always show statusline
set mouse=a                       " Enable the mouse
set noshowmode
set noswapfile
set nowritebackup
set number
set scrolloff=10                  " Lines above and below cursor when scrolling
set shell=/bin/bash
set textwidth=80
set wildmenu
set wildmode=list:longest,full

" Indentation
set autoindent
set copyindent
set smartindent

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

Plug 'ap/vim-css-color'
Plug 'bling/vim-airline'
Plug 'Chiel92/vim-autoformat'
Plug 'davidhalter/jedi-vim'
Plug 'fisadev/vim-isort'
Plug 'hynek/vim-python-pep8-indent'
Plug 'kien/ctrlp.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'ntpeters/vim-better-whitespace'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'Raimondi/delimitMate'
Plug 'rking/ag.vim'
Plug 'rstacruz/sparkup'
Plug 'scrooloose/syntastic'
Plug 'spolu/dwm.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'tmhedberg/SimpylFold'
Plug 'tomasr/molokai'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Plugin Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set ttimeoutlen=50
let g:airline_theme='dark'

" EasyMotion
let g:EasyMotion_smartcase = 1

 " Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = '▲'

" Molokai
colorscheme molokai
let g:rehash256 = 1
" Highlights don't play well with 'cursorline'
highlight clear SpellBad
highlight SpellBad cterm=underline ctermfg=red

" Ctrl-P
let g:ctrlp_extensions = ['buffertag']
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_match_window = 'max:35'

" indentLine
let g:indentLine_char = '|'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ag
nnoremap <leader>a :Ag<space>

" Shift key is effort...
nnoremap ; :
vnoremap ; :

" Retain selection when indenting
vnoremap < <gv
vnoremap > >gv

" Share tab mappings with Ranger
nnoremap <A>1 1gt
nnoremap <A>2 2gt
nnoremap <A>3 3gt
nnoremap <A>4 4gt
nnoremap <A>5 5gt
nnoremap <A>6 6gt
nnoremap <A>7 7gt
nnoremap <A>8 8gt
nnoremap <A>9 9gt
nnoremap <C-t> :tabnew<CR>

" EasyMotion
" Remap default binding to single <leader>
map <Leader> <Plug>(easymotion-prefix)
" 2 character search
map s <Plug>(easymotion-s2)
map t <Plug>(easymotion-t2)
" n character search
map  / <Plug>(easymotion-sn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
" Easier hjkl
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0 " Keep cursor column for jk

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Show spelling errors with Git commit messages and Markdown
autocmd BufNewFile,BufRead COMMIT_EDITMSG,*.md setlocal spell

" Python lines should not be longer than 79 chars
autocmd BufReadPre *.py setlocal textwidth=79

" Rainbow parentheses
autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces

" Strip all whitespace on save
autocmd BufWritePre * silent! StripWhitespace

" Autosort Python imports on save
autocmd BufWritePre *.py silent! Isort

" Autoformat code on save
autocmd BufWritePre *.css,*.html,*.js,*.py silent! Autoformat
