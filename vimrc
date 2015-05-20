"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
set shiftwidth=4                    " Number of spaces when indenting and dedenting
set shiftround
set softtabstop=4                   " Backspace right through 'tab's

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" Aesthetics
Plug 'nanotech/jellybeans.vim'

" General
Plug 'vim-scripts/vim-auto-save'
Plug 'tpope/vim-fugitive'
Plug 'Valloric/YouCompleteMe'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'Raimondi/delimitMate'
Plug 'Lokaltog/vim-easymotion'
Plug 'szw/vim-tags'
Plug 'benekastah/neomake'
Plug 'Chiel92/vim-autoformat'
Plug 'rking/ag.vim'

" Clojure
Plug 'tpope/vim-fireplace'
Plug 'luochen1990/rainbow'
Plug 'vim-scripts/paredit.vim'

" Testing
Plug 'janko-m/vim-test'

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

" EasyMotion
map , <Plug>(easymotion-prefix)
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
map / <Plug>(easymotion-sn)
let g:EasyMotion_smartcase = 1
omap n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)

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

" Rainbow
let g:rainbow_active = 1

" YCM
let g:ycm_autoclose_preview_window_after_insertion = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" AutoFormat
nnoremap <leader>f :Autoformat<cr>

" Easily get back to last file edited, good for TDD...
nnoremap <leader><leader> <C-^>

" CtrlP
nnoremap <leader>p :CtrlP<cr>
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <leader>b :CtrlPBufTag<cr>

" Shift key is effort...
noremap ; :
noremap : ;

" Fake text objects for entire buffer
nnoremap cae ggdGi
nnoremap dae ggdG
nnoremap vae ggVG
nnoremap yae ggyG

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
