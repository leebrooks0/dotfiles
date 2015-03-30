""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
filetype plugin indent on
let mapleader = ' '

set autoread                      " Autoread files when externally updated
set background=dark
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

" Indentation
set autoindent
set smartindent

" Tabs and spaces
set expandtab                       " Replace tabs with spaces
set shiftwidth=4                    " Number of spaces when indenting and dedenting
set tabstop=4                       " Spaces per tab
set softtabstop=4                   " Backspace right through 'tab's
set shiftround                      " Round indent to multiples of shiftwidth

" More natural window splitting
set splitright

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" Aesthetics
Plug 'tomasr/molokai'

" General
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'kien/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'

" Text Objects
Plug 'kana/vim-textobj-user'
Plug 'bps/vim-textobj-python'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-indent'
Plug 'lucapette/vim-textobj-underscore'

" Utilities
Plug 'Chiel92/vim-autoformat'
Plug 'Raimondi/delimitMate'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-surround'
Plug 'rking/ag.vim'

" Git
Plug 'tpope/vim-fugitive'

" Python
Plug 'davidhalter/jedi-vim'
Plug 'fisadev/vim-isort'

" Web
Plug 'rstacruz/sparkup'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'marijnh/tern_for_vim'
Plug 'ap/vim-css-color'

" Other Languages
Plug 'suan/vim-instant-markdown'
Plug 'exu/pgsql.vim'

" Testing
Plug 'benmills/vimux'
Plug 'janko-m/vim-test'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Plugin Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Jedi, only want refactoring support as YCM handles code completion
let g:jedi#completions_enabled = 0

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
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_match_window = 'max:40'

" test.vim
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
let g:test#strategy = 'vimux'

" NERDTree
let g:nerdtree_tabs_open_on_console_startup = 1
let NERDTreeShowHidden = 1
let NERDTreeIgnore=['__pycache__', '\.pyc$', '\.git$', '\~$']
let NERDAutoDeleteBuffer = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" CtrlP
nnoremap <leader>p :CtrlP<cr>
nnoremap <leader>f :CtrlPFunky<cr>

" Shift key is effort...
nnoremap ; :
vnoremap ; :

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
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" NERDTreeTabs
nnoremap <Leader>n :NERDTreeTabsFind<CR>

" Tagbar
nmap <silent> <leader>b :TagbarOpenAutoClose<CR>

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

" Autosort Python imports on save
autocmd BufWritePre *.py silent! Isort

" Autoformat code on save
autocmd BufWritePre *.css,*.html,*.js,*.py silent! Autoformat
