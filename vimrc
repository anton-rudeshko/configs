" Make vim more useful
set nocompatible
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Optimize for fast terminal connections (scrolling etc)
set ttyfast
" Add the g flag to search/replace by default
set gdefault

" Enable line numbers
set number

" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline

" Make tabs as wide as four spaces
set tabstop=4
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title

set softtabstop=4
set smartindent
set shiftwidth=4
set expandtab

vnoremap < <gv
vnoremap > >gv

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set pastetoggle=<leader>v

" Solarized
set t_Co=16
if has("gui_running")
    set t_Co=256
    let g:solarized_termcolors=256
endif

set background=dark
