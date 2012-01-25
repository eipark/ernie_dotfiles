call pathogen#infect()

syntax enable 
set background=dark

" solarized options
" termcolors should be off, but it looks better with it in the terminal! find these colors!
"let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
"let g:solarized_contrast = "high"
colorscheme solarized

set expandtab
set tabstop=2 
set shiftwidth=2
set softtabstop=2

set listchars=tab:>\ ,trail:•,extends:>,precedes:<,nbsp:+ "show hard tabs/trailing spaces/etc
set list                          " show trailing whiteshace and tabs
set mouse=a 

set title
set ignorecase

set showcmd

set ruler

set number
set cursorline cursorcolumn
set autoindent
if has ("gui_running")
	set guioptions=egmrt
	set guioptions-=r " disable right scrollbar 
endif
