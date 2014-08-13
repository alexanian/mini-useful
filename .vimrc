" Tess vimrc August 2014
"
" Don't be vi compatible
set nocompatible

" Visuals
"""""""""""""""""""""""""""""""
" Pretty colours
colorscheme desert
set background=dark

" Show syntax
syntax on

" Show line number
set ruler
set number

" Indentation
"""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Indent automatically, copying previous indentation
set autoindent
set copyindent

" Misc
"""""""""""""""""""""""""""""""
" Show what is being typed as a command
set showcmd
set cmdheight=2

" Show two lines of context when scrolling to the top and bottom
set scrolloff=2

" Show matching parens
set showmatch

" Search incrementally and highlight results
set incsearch
set hlsearch

" Increase history and undo lengths
set history=50
set undolevels=50

" Key Mappings
"""""""""""""""""""""""""""""""
" Map jj to the escape sequence
:inoremap jj <Esc>

" Overidde encryption command
cnoreabbrev <expr> X (getcmdtype() is# ':' && getcmdline() is# 'X') ? 'x' : 'X'

" Make space to pagedown and - to pageup
noremap <Space> <PageDown>
noremap - <PageUp>

" Remap semicolon to colon (quicker typing!)
nnoremap ; :
