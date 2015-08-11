"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ' '

set autoindent
set autoread                      " Autoread files when externally updated
set background=dark
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug 'nanotech/jellybeans.vim'
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

" Text Objects
Plug 'kana/vim-textobj-user'
Plug 'bps/vim-textobj-python'
Plug 'kana/vim-textobj-entire'

" Language Support
Plug 'othree/html5.vim'
Plug 'rstacruz/sparkup'
Plug 'cakebaker/scss-syntax.vim'
Plug 'exu/pgsql.vim'

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

" Airline
let g:airline_powerline_fonts = 1

" DelimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_expand_inside_quotes = 1
let delimitMate_balance_matchpairs = 1

" Colorschme
colorscheme jellybeans
" Highlights don't play well with 'cursorline'
highlight clear SpellBad
highlight SpellBad cterm=underline ctermfg=red

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

" AutoFormat
nnoremap <leader>f :Autoformat<cr>
nnoremap <leader>i :silent !isort %<cr>

" Easily get back to last file edited, good for TDD...
nnoremap <leader><leader> <C-^>

" CtrlP
nnoremap <leader>p :CtrlP<cr>
nnoremap <leader>b :CtrlPBufTag<cr>
nnoremap <leader>l :CtrlPLine<cr>

" Shift key is effort...
noremap <cr> :
" Restore <cr> in the quickfix buffer only
autocmd BufRead quickfix nnoremap <buffer> <cr> <cr>

" Easier escape
inoremap jj <esc>
inoremap jk <esc>

" Neovim terminal
tnoremap <esc> <C-\><C-n>

" Easier window management
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Show spelling errors with Git commit messages and Markdown
autocmd BufNewFile,BufRead COMMIT_EDITMSG,*.md setlocal spell

" .md files should be detected as Markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown

" Python lines should not be longer than 79 chars
autocmd BufReadPre *.py setlocal colorcolumn=79

" Strip all whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Run neomake on every save
autocmd! BufWritePost * silent! Neomake

" Generate tags file
autocmd! BufWritePost *.md,*.py,*.scss !ctags -R &
