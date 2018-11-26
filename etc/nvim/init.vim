filetype off

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
syntax on
filetype plugin indent on

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
