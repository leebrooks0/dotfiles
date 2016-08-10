let mapleader = ' '

set background=dark
set colorcolumn=80
set clipboard+=unnamedplus
set cursorline
set gdefault
set noswapfile
set nowrap
set nowritebackup
set number
set ruler
set scrolloff=10                  " Lines above and below cursor when scrolling
set shell=/bin/bash
set undofile
set wildmode=list:longest,full

" Searching
set nohlsearch
set ignorecase
set smartcase

" Tabs and spaces
set expandtab                       " Replace tabs with spaces
set shiftwidth=2                    " Number of spaces when indenting and dedenting
set shiftround
set softtabstop=2                   " Backspace right through 'tab's

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" Navigation
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'

" Code completion
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'rking/ag.vim'
Plug 'vim-scripts/vim-auto-save'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'benekastah/neomake'
Plug 'Chiel92/vim-autoformat'
Plug 'janko-m/vim-test'
Plug 'ludovicchabant/vim-gutentags'
Plug 'rstacruz/sparkup'

" Text Objects
Plug 'kana/vim-textobj-user'
Plug 'bps/vim-textobj-python'
Plug 'kana/vim-textobj-entire'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Plugin Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" CtrlP
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] " Ignore files in .gitignore
let g:ctrlp_match_window = 'max:30'
let g:ctrlp_show_hidden = 1
let g:ctrlp_extensions = ['buffertag', 'line']

" NERDTree
nnoremap <silent><F8> :NERDTreeToggle<cr>
nnoremap <silent><F9> :NERDTreeFind<cr>
let NERDTreeIgnore=['\.pyc$', '__pycache__', '\.egg-info$']

" Tagbar
let g:tagbar_sort = 0 " Don't sort A-Z
nnoremap <silent><F7> :TagbarToggle<cr>

" YCM
let g:ycm_autoclose_preview_window_after_insertion = 1

" Colorscheme
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

" AutoSave
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1

" test.vim
nnoremap <leader>n :TestNearest<CR>
nnoremap <leader>t :TestFile<CR>
nnoremap <leader>a :TestSuite<CR>
nnoremap <leader>l :TestLast<CR>
nnoremap <leader>v :TestVisit<CR>
let test#python#runner = 'pytest'
let test#python#pytest#options = {
  \ 'file':    '--tb=short',
  \ 'suite':   '--tb=no',
\}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" AutoFormat
nnoremap <leader>f :Autoformat<cr>
nnoremap <leader>i :silent !isort %<cr>

" Easily get back to last file edited, good for TDD...
nnoremap <leader><leader> <C-^>

" Ctrl-p
nnoremap <silent><leader>p :CtrlP<CR>
nnoremap <silent><leader>b :CtrlPBufTag<CR>

" Fugitive
nnoremap <leader>g :Gstatus<cr>
nnoremap <leader>r :Gread<cr>
nnoremap <leader>d :Gdiff<cr>

" Easier window management
nnoremap <up> <C-w>k
nnoremap <down> <C-w>j
nnoremap <left> <C-w>h
nnoremap <right> <C-w>l

" Make Y act like D, C etc.
nnoremap Y y$

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Python lines should not be longer than 79 chars
autocmd BufReadPre *.py setlocal colorcolumn=79

" Strip all whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Run neomake on every save
autocmd! BufWritePost * silent! Neomake
