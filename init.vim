let mapleader = ' '

set background=dark
set clipboard=unnamedplus
set gdefault
set noswapfile
set nowrap
set number
set undofile

" Searching
set nohlsearch

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/vim-auto-save'
Plug 'tpope/vim-commentary'
Plug 'benekastah/neomake'
Plug 'janko-m/vim-test'
Plug 'rking/ag.vim'

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'bps/vim-textobj-python'

call plug#end()

colorscheme gruvbox

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"

" CtrlP
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] " Ignore files in .gitignore
let g:ctrlp_match_window = 'max:30'
let g:ctrlp_show_hidden = 1
let g:ctrlp_extensions = ['buffertag', 'line']
nnoremap <silent><leader>p :CtrlP<CR>
nnoremap <silent><leader>b :CtrlPBufTag<CR>

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

" Easily get back to last file edited, good for TDD...
nnoremap <leader><leader> <C-^>

nnoremap <leader>f :!autopep8 -i %<cr>

" Make Y act like D, C etc.
nnoremap Y y$

" Run neomake on every save
autocmd! BufWritePost * silent! Neomake

" Strip all whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
