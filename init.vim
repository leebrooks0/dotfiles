let mapleader = ' '

set background=dark
set colorcolumn=80
set clipboard+=unnamedplus
set cursorline
set gdefault
set mouse=
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

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'rking/ag.vim'
Plug 'vim-scripts/vim-auto-save'
Plug 'tpope/vim-fugitive'
Plug 'Valloric/YouCompleteMe'
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

" Colorscheme
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

" AutoSave
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1

" Neomake
let g:neomake_error_sign = {
      \ 'text': 'E>',
      \ 'texthl': 'ErrorMsg',
      \ }
let g:neomake_warning_sign = {
      \ 'text': 'W>',
      \ 'texthl': 'WarningMsg',
      \ }

" test.vim
nnoremap <leader>n :TestNearest<CR>
nnoremap <leader>t :TestFile<CR>
nnoremap <leader>a :TestSuite<CR>
nnoremap <leader>l :TestLast<CR>
nnoremap <leader>v :TestVisit<CR>
let test#python#runner = 'pytest'
let test#python#pytest#options = {
  \ 'file':    '--tb=line',
  \ 'suite':   '--tb=line',
\}

" YCM
let g:ycm_autoclose_preview_window_after_insertion = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Make enter more useful in normal mode
nnoremap <Enter> o<Esc>
nnoremap <BS> O<Esc>

" Disable arrow keys in insert mode
inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>

" AutoFormat
nnoremap <leader>f :Autoformat<cr>
nnoremap <leader>i :silent !isort %<cr>

" Easily get back to last file edited, good for TDD...
nnoremap <leader><leader> <C-^>

" fzf
nnoremap <silent> <leader>p :Files<CR>
nnoremap <silent> <leader>s :Buffers<CR>
nnoremap <silent> <leader>l :BLines<CR>
nnoremap <silent> <leader>. :Lines<CR>
nnoremap <silent> <leader>b :BTags<CR>
nnoremap <silent> <leader>/ :Ag<CR>

" Fugitive
nnoremap <leader>g :Gstatus<cr>
nnoremap <leader>r :Gread<cr>
nnoremap <leader>d :Gdiff<cr>

" Easier escape
inoremap jj <esc>
inoremap jk <esc>

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
