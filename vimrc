""" Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
filetype plugin indent on
let mapleader = ' '

set autoread                      " Autoread files when externally updated
set backspace=indent,eol,start    " Backspace like you would expect
set clipboard=unnamedplus         " Use the system clipboard for copy and paste
set colorcolumn=80
set cursorline
set encoding=utf-8
set history=200
set laststatus=2                  " Always show statusline
set noswapfile
set nowrap
set nowritebackup
set number
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
set softtabstop=4                       " Backspace right through 'tab's

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" Aesthetics
Plug 'nanotech/jellybeans.vim'
Plug 'bling/vim-airline'

" General
Plug 'vim-scripts/vim-auto-save'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'
Plug 'Raimondi/delimitMate'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'osyo-manga/vim-over'
Plug 'PeterRincker/vim-argumentative'
Plug 'Lokaltog/vim-easymotion'

" Text Objects
Plug 'kana/vim-textobj-user'
Plug 'bps/vim-textobj-python'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'

" Utilities
Plug 'Chiel92/vim-autoformat'
Plug 'ntpeters/vim-better-whitespace'
Plug 'rking/ag.vim'

" Git
Plug 'tpope/vim-fugitive'

" Web
Plug 'rstacruz/sparkup'
Plug 'marijnh/tern_for_vim'

" Languages
Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim'
Plug 'suan/vim-instant-markdown'
Plug 'exu/pgsql.vim'
Plug 'ap/vim-css-color'

" Testing
Plug 'janko-m/vim-test'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Plugin Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Airline
let g:airline_powerline_fonts = 1
set ttimeoutlen=50

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

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Colorschme
colorscheme jellybeans
" Highlights don't play well with 'cursorline'
highlight clear SpellBad
highlight SpellBad cterm=underline ctermfg=red

" Ctrl-P
let g:ctrlp_extensions = ['buffertag']
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_match_window = 'max:40'

" test.vim
nnoremap <leader>n :TestNearest<CR>
nnoremap <leader>t :TestFile<CR>
nnoremap <leader>a :TestSuite<CR>
nnoremap <leader>l :TestLast<CR>
nnoremap <leader>v :TestVisit<CR>

" NERDTree
let NERDTreeShowHidden = 1
let NERDTreeIgnore=['__pycache__', '\.pyc$', '\.git$', '\~$']
let NERDAutoDeleteBuffer = 1

" YCM
let g:ycm_autoclose_preview_window_after_insertion = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" <esc> is miles away...
inoremap jk <esc>

" Easily get back to last file edited, good for TDD...
nnoremap <leader><leader> <C-^>

" CtrlP
nnoremap <leader>p :CtrlP<cr>

" Shift key is effort...
noremap ; :
noremap : ;

" Share tab mappings with Ranger
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <C-T> :tabnew<CR>

" Easier window navigation
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

" NERDTree
nnoremap <F9> :NERDTreeFind<CR>
nnoremap <F10> :NERDTreeToggle<CR>

" Over
noremap <leader>o :OverCommandLine<CR>

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
autocmd BufWritePre * silent! StripWhitespace
