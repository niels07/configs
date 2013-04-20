" {{{ Vundle plugin management
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'
" original repos on github
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-pathogen'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/nerdtree'
Bundle 'paulhazen/compview'
Bundle 'majutsushi/tagbar'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'tpope/vim-surround'
Bundle 'Raimondi/delimitMate'
Bundle 'sjl/gundo.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'benmills/vimux'
" Colorschemes
Bundle 'nanotech/jellybeans.vim'

" }}}

" {{{ General configuration
set background=dark

if &t_Co == 256 || has('gui_running')
    colors jellybeans
else
    colors jellybeans " Or some other 16-color scheme
endif

if has("gui_running")
    if has("gui_gtk2")
        set guifont=monospace\ 8
    elseif has("gui_win32")
        set guifont=Consolas:h11:cANSI
    endif
endif

set encoding=utf-8
set fileencoding=utf-8
set nocompatible
set laststatus=2
set modelines=0
set visualbell
set t_vb=
set mouse=a
set number
"set relativenumber
set scrolloff=3
set showcmd
set showmode 
set showmatch
set foldlevel=5
set foldmethod=indent
set foldnestmax=2
set nuw=5
set preserveindent
set copyindent
set spelllang=pl,en
set autochdir
set wildmenu
set wildmode=list:longest
set shortmess=at
set cmdheight=1
set makeprg=make\ clean\ &&\ make\ -j4\ --silent
au FileType cpp set makeprg=/usr/bin/g++\ \-g\ \-Wall\ \-pedantic\ \"%\"\ -o\ \"%<.out\"
au FileType java set errorformat=%A%f:%l:\ %m,%-Z%p^,%C\ \ :\ %m,%-C%.%#
au FileType cpp set errorformat=%f:%l:%c:\ %m
au FileType c set cindent
set backupdir=~/.vim/backup/
set directory=~/.vim/temp/ 
if has('persistent_undo')
  set undofile
  set undodir=~/.vim/undo
  set undolevels=100
  set undoreload=1000
endif

" Tab width
set softtabstop=4
set shiftwidth=4
set tabstop=4
set cinoptions=>4

" Compatible tabs
set expandtab

" Get rid of useless GUI elements
set guioptions-=T
set guioptions-=L
set guioptions-=l
set guioptions-=b
set guioptions-=m
set guioptions-=r
set wrap
set is
set ic
" highlighting search results
set hlsearch
" start searching as you type
set incsearch
set smartcase
" Show matching brackets
set sm

set noerrorbells
syntax on
set ttyfast
set shell=zsh
set ruler
set cursorline
" }}}

" {{{ Plugin configuration
let g:jellybeans_use_lowcolor_black = 0

" Changing leader
let mapleader = ','

" Vertical TreeExplore
let g:treeExplVertical=1
let g:treeExplWinSize=35
let g:treeExplDirSort=1
let g:NERDTreeWinPos = "left"

" MiniBufExplorer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 
let g:miniBufExplMaxSize = 2
let g:miniBufExplMoreThanOne = 1
let g:miniBufExplUseSingleClick = 1

" TagBar
let g:tagbar_left = 1
let g:tagbar_width = 30
set tags=tags;/

" Stop CtrlP from recalculating on files on start
let g:ctrlp_clear_cache_on_exit = 0

" EasyMotion leader
let g:EasyMotion_leader_key = ','

" Using Ag instead of Ack
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['.root', 'Makefile']

" special characters in powerline
let g:Powerline_symbols = 'fancy'
let g:Powerline_stl_path_style = 'filename'

" }}}

" {{{ Key Mappings
noremap     <Up>                :echoerr "Use k instead!"<CR>$
noremap     <Down>              :echoerr "Use j instead!"<CR>$
noremap     <Left>              :echoerr "Use l instead!"<CR>$
noremap     <Right>             :echoerr "Use h instead!"<CR>$
map         <S-Insert>          <MiddleMouse>
map!        <S-Insert>          <MiddleMouse>
map         <S-Insert>          <S-Insert>
nmap        <silent> s          :let @/ = ""<CR>
nnoremap    <silent> <C-l>      :tabnext<CR>
nnoremap    <silent> <C-h>      :tabprevious<CR>
nnoremap    <silent> <C-t>      :tabnew<CR>
nnoremap    <leader>W           :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap    <leader>d           <C-w>v<C-w>l
nnoremap    <leader>s           <C-w>s<C-w>l

" toggle syntax highlight
map <F7> :if exists("syntax_on")<Bar>syntax off<Bar>else<Bar>syntax enable<Bar>endif<CR>
map <silent> <F5> "<Esc>:silent setlocal spell!<CR>"

" }}}

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
