let mapleader = ' '

set autoindent
set autoread                      " Autoread files when externally updated
set backspace=indent,eol,start    " Backspace like you would expect
set colorcolumn=80
set cursorline
set history=200
set laststatus=2                  " Always show statusline
set noswapfile
set nowrap
set nowritebackup
set number
set ruler
set scrolloff=10                  " Lines above and below cursor when scrolling
set shell=/bin/bash
set wildmenu
set wildmode=list:longest,full

" Searching
set incsearch
set ignorecase
set smartcase

" Tabs and spaces
set expandtab                       " Replace tabs with spaces
set shiftwidth=2                    " Number of spaces when indenting and dedenting
set shiftround
set softtabstop=2                   " Backspace right through 'tab's

colorscheme desert
highlight ColorColumn ctermbg=234
highlight CursorLine ctermbg=234 cterm=NONE

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/vim-auto-save'
Plug 'tpope/vim-fugitive'
Plug 'Valloric/YouCompleteMe'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'Raimondi/delimitMate'
Plug 'benekastah/neomake'
Plug 'Chiel92/vim-autoformat'
Plug 'rking/ag.vim'
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

" AutoSave
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1

" DelimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_expand_inside_quotes = 1
let delimitMate_balance_matchpairs = 1


" Ctrl-P
let g:ctrlp_extensions = ['tag', 'buffertag']
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_match_window = 'max:40'
" To find out what tag kinds are recognised for the specific language:
" ctags --list-kinds=language|all
let g:ctrlp_buftag_types = {
            \ 'scss': '--scss-types=citmv',
            \ }

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

" CtrlP
nnoremap <leader>p :CtrlP<cr>
nnoremap <leader>b :CtrlPBufTag<cr>
nnoremap <leader>l :CtrlPLine<cr>

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

" Less use of shift key in python
autocmd FileType python inoremap - _
autocmd FileType python inoremap _ -
autocmd FileType python inoremap ; :
autocmd FileType python inoremap : ;

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" .md files should be detected as Markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown

" Python lines should not be longer than 79 chars
autocmd BufReadPre *.py setlocal colorcolumn=79

" Strip all whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Run neomake on every save
autocmd! BufWritePost * silent! Neomake
