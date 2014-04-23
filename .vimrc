call pathogen#infect()

syntax enable
" file types
au BufRead,BufNewFile *.twig set filetype=htmljinja
au BufRead,BufNewFile *.hamlpy set filetype=haml

"set background=dark

" solarized options
" termcolors should be off, but it looks better with it in the terminal! find these colors!
"let g:solarized_termcolors = 256
"let g:solarized_visibility = "high"
"let g:solarized_contrast = "high"
colorscheme molokai

set showmode                    "always show current (editing) mode
set expandtab                   "expand tabs by default
set tabstop=2                   "tab is 2 spaces
set shiftwidth=2                "number of spaces for autoindenting
set softtabstop=2               "when hitting <BS>, pretend like a tab is removed, even if spaces
set title                       "change terminal's title to filename
set ignorecase                  "ignore case while searching
set smartcase                   "ignore case if search pattern is all lowercase
set hlsearch                    "highlight search items
set incsearch                   "show search matches as you type
set showcmd                     "show (partial) command in the last line of the screen
                                "    this also shows visual selection info
set ruler                       "show line, column in bottom right
set number                      "show line numbers
set cursorline cursorcolumn     "highlight cursors line and column
set autoindent                  "always set autoindenting on
set mouse=a                     "enable mouse
set pastetoggle=<F2>            " when in insert mode, press <F2> to go to
                                " paste mode, where you can paste mass data
                                " that won't be autoindented
set listchars=tab:▸\ ,trail:•,extends:>,precedes:<,nbsp:+ "show hard tabs/trailing spaces/etc
set list                        "show trailing whiteshace and tabs
set nobackup

" change the mapleader from \ to ,
let mapleader=","

"use semicolon instead of colon
nnoremap ; :

"jk instead of <Esc>
imap jk <Esc>

" Remap j and k to act as expected when used on long, wrapped, lines
nnoremap j gj
nnoremap k gk

" Vim behavior
set hidden                      "hide buffers instead of closing them this
                                "   means that the current buffer can be put
                                "   to background without being written; and
                                "   that marks and undo history are preserved
set noswapfile                  "no annoying swap files

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"switch between relative and absolute line numbers
"set rnu
"au InsertEnter * :set nu
"au InsertLeave * :set rnu
"au FocusLost * :set nu
"au FocusGained * :set rnu

"for macvim
if has ("gui_running")
  set guioptions=egmrt
  set guioptions-=r             "disable right scrollbar
endif

map <C-c> :.w !pbcopy<CR>
"map <C-v> :r !pbpaste<CR>
