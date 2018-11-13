" Make vim more useful
set nocompatible

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'chaoren/vim-wordmotion'
Plugin 'easymotion/vim-easymotion'
Plugin 'vimoutliner/vimoutliner'
Plugin 'leafgarland/typescript-vim'
Plugin 'vim-scripts/vim-auto-save'

call vundle#end()
filetype plugin on

" enable AutoSave on Vim startup
let g:auto_save = 1

" do not save while in insert mode
let g:auto_save_in_insert_mode = 0

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

set spelllang=ru_yo,en_us

" Enhance command-line completion
set wildmenu
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
" Keep cursor away from top/bottom of screen
set scrolloff=5

" Make tabs as wide as four spaces
set tabstop=4
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Override the 'ignorecase' option if the search pattern contains upper case characters.
set smartcase
" Highlight dynamically as pattern is typed
set incsearch
" Do not wrap search around the end of the file
set nowrapscan
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
