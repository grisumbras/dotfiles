filetype off

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
syntax on
filetype plugin indent on

set keymap=russian-jcukenwin
set fileencodings=ucs-bom,utf-8,cp1251,default,latin1
set iminsert=0
set imsearch=0
set clipboard=unnamedplus

set noequalalways
set linebreak
set display=lastline
set updatetime=250

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set scrolloff=3
set sidescrolloff=5
set autoindent
set noshowmode
set showcmd
set hidden
set visualbell
set cursorline
set noruler
set number
set relativenumber
set undofile
set nrformats-=octal
set ttimeout
set ttimeoutlen=100
set foldmethod=syntax

set mouse=a
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

set wildmenu
set wildmode=longest,list:full
set wildcharm=<Tab>

set ignorecase
set smartcase
set incsearch
set hlsearch
set gdefault
set showmatch
set nowrap
set colorcolumn=80
set formatoptions-=tc
set formatoptions+=qrn1j

set list
set lcs=tab:▸\ ,trail:·

set grepprg=ag\ --vimgrep
set complete=.,w,b,u,t
set completeopt=menuone,preview,longest

set autoread
set history=1000
set tabpagemax=50
set sessionoptions-=options

set termguicolors
set background=dark
let g:gruvbox_italic=1
colorscheme gruvbox
set guicursor=n-v-c:block-nCursor/lCursor
set guicursor+=i-ci:ver25-iCursor/lCursor
set guicursor+=r-cr:hor20-iCursor/lCursor

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts=1
let g:airline_theme='gruvbox'
let g:airline_section_z = airline#section#create(['%{ObsessionStatus(''$'', '''')}', 'windowswap', '%3p%% ', 'linenr', ':%3v '])

let g:targets_argOpening = '[({[<]'
let g:targets_argClosing = '[]})>]'

let g:b2_makeprg_params = '-j5'

set spellfile="~/.local/etc/nvim/spellfile"

augroup myFocusLost
  au FocusLost * :wa
augroup END

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif
augroup END

augroup autoRemoveTrailingWs
  autocmd BufWritePre * :%s/\s\+$//e
augroup END

let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

nnoremap Y y$

nnoremap <Leader>h <C-w>v<C-w>l
nnoremap <Leader>v <C-w>s<C-w>j

nnoremap <silent> [a :previous<CR>
nnoremap <silent> ]a :next<CR>
nnoremap <silent> [A :first<CR>
nnoremap <silent> ]A :last<CR>

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>
nnoremap <silent> [Q :cfirst<CR>
nnoremap <silent> ]Q :clast<CR>

nnoremap <silent> [l :lprevious<CR>
nnoremap <silent> ]l :lnext<CR>
nnoremap <silent> [L :lfirst<CR>
nnoremap <silent> ]L :llast<CR>

nnoremap <silent> [t :tabprevious<CR>
nnoremap <silent> ]t :tabnext<CR>
nnoremap <silent> [T :tabfirst<CR>
nnoremap <silent> ]T :tablast<CR>

nnoremap <Leader>src :source $MYVIMRC<CR>
nnoremap <Leader>erc :e$MYVIMRC<CR>
nnoremap <Leader>d :20Lexplore<CR>

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

nnoremap <silent> gr :grep! <C-r><C-w><CR>:cw<CR>
nnoremap <silent> gR :grep! '\b<C-r><C-w>\b':cw<CR>

nnoremap <C-S> :w!<CR>
nnoremap <C-q> :BD<CR>

nnoremap <silent> <F5> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

nnoremap m,i :Make install<CR>
nnoremap m,t :Make test<CR>
nnoremap m,c :Make check<CR>
