""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author:
"   Nick Topping
"
" Creation Date:
"   November 12, 2016
"
" Sources:
"   - https://github.com/amix/vimrc
"   - https://github.com/NRTopping/VimConfig
"
" Sections:
"   - Plugins
"   - General
"   - Interface
"   - Colors and fonts
"   - Files
"   - Text, Tabs, and Indentation
"   - Movement
"   - Status
"   - Editing
"   - Spell Checking
"   - Plugin Settings
"   - Misc
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'powerline/fonts'
Plugin 'Raimondi/delimitMate'
Plugin 'marijnh/tern_for_vim'
Plugin 'vim-scripts/closetag.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jeffkreeftmeijer/vim-numbertoggle',

call vundle#end()
filetype plugin indent on
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Reiterating that \ is the mapleader
let mapleader="\\"
let g:mapleader="\\"

" :W sudo saves the file
command W w !sudo tee % > /dev/null

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 5 lines above/below cursor when moving vertically
set scrolloff=5

" Turn on wildmenu - match the longest, and list all
set wildmenu
set wildmode=list:longest,full

" Ignore compiled files in wildmenu
set wildignore=*.o,*~,*.pyc,*.class

" Ignore OS X specific files
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" Hide buffers instead of closing
set hid

" Configure backspace to act normally
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" Be smart about cases when searching
set smartcase

" Highlight search results
set hlsearch

" Make search act like browsers
set incsearch

" Don't redraw while executing macros
set lazyredraw

" For regex
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Remove Errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable Syntax highlighting
syntax enable

" Set utf8 as standard encoding, en_US as standard language
set encoding=utf8

" Use solarized color from plugin
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
if !has('gui_running')
  let g:solarized_termtrans=1
endif
set background=dark
colorscheme solarized

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, Tabs, and Indentation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab
set smarttab

" Tabs are 2 spaces
set tabstop=2
set shiftwidth=2

" linebreak on 100 characters
set lbr
set textwidth=100

set autoindent
set smartindent
set wrap

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Movement
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move between windows with ctrl+<h,j,k,l>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Disable highlight when <leader><CR> is pressed
map <silent> <leader><CR> :noh<CR>

" Close current buffer
map <leader>bd :Bclose<CR>:tabclose<CR>gT

" Close all buffers
map <leader>ba :bufdo bd<CR>

" Move between buffers
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>
nmap <C-e> :e #<CR>

" Managing tabs
map <leader>tn :tabnew<CR>
map <leader>to :tabonly<CR>
map <leader>tc :tabclose<CR>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

"let tl toggle between this and previous tab
let g:lasttab=1
nmap <leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab=tabpagenr()

" Open a new tab with the current buffer's path
map <leader>te :tabedit <c-r>=expand("%p:h")<cr>/

" Switch current working directory to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" specify behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return the last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") |
  \ exe "normal! g'\"" | endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Movement
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using CTRL+Shift+[jk]
nnoremap <c-s-j> :m .+1<CR>==
nnoremap <c-s-k> :m .-2<CR>==
inoremap <c-s-j> <Esc>:m .+1<CR>==gi
inoremap <c-s-k> <Esc>:m .-2<CR>==gi
vnoremap <c-s-j> :m '>+1<CR>gv=gv
vnoremap <c-s-k> :m '<-2<CR>gv=gv

" Delete trailing white space on save
func! DeleteTrailingWhiteSpace()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWhiteSpace()

" Turn persistent undo on - meaning can undo even after closing a buffer/VIM
try
  set undodir=~/.vim_runtime/temp_dirs/undodir
  set undofile
catch
endtry

" Turn persistent undo on - meaning can undo even after closing a buffer/VIM
try
  set undodir=~/.vim_runtime/temp_dirs/undodir
  set undofile
catch
endtry

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell Checking
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>ss :setlocal spell!<CR>

map <leader>sn ]s
map <leader>sp [s
map <leader>za zg
map <leader>s? z=

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerd tree toggle
map <leader>d :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open a buffer for scribble
map <leader>q :e ~/buffer<CR>

" Quickly open a markdown buffer for scribble
map <leader>md :e ~/buffer.md<CR>

" Toggle past mode on and off
map <leader>o :setlocal paste!<CR>

" iterm2 mouse scrolling
if has ('mouse_sgr')
  set ttymouse=sgr
endif
set mouse=nicr

