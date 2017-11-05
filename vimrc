execute pathogen#infect()
syntax on
filetype plugin indent on

colo desert
" autocmd VimEnter * NERDTree "
autocmd FileType html setlocal shiftwidth=4 tabstop=4
cd /srv/
au BufRead,BufNewFile *.md set filetype=markdown

" Use :help 'option' to see the documentation for the given option.

set autochdir
set tags=tags;/
set clipboard=unnamedplus
set expandtab
set shiftwidth=4
set softtabstop=4
set autoindent
set backspace=indent,eol,start

set complete-=1
set showmatch
set smarttab

set nrformats-=octal
set shiftround

set ttimeout
set ttimeoutlen=50

set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

set laststatus=2
set ruler
set showcmd
set wildmenu

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
    let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
  endif
endif

if &tabpagemax < 50
  set tabpagemax=50
endif

if !empty(&viminfo)
  set viminfo^=!
endif

set autoread
set ignorecase
set smartcase
set hlsearch
set wrap !
set sidescroll=5
set listchars+=precedes:<,extends:>

set splitbelow
set splitright

let NERDTreeIgnore = ['\.pyc$']

let g:syntastic_python_checkers=['pyflakes']

function Py2()
  let g:syntastic_python_python_exec = '/usr/bin/python'
endfunction

function Py3()
  let g:syntastic_python_python_exec = '/usr/bin/python3'
  let g:syntastic_python_pyflakes_exec = '/usr/bin/pyflakes3'
endfunction

call Py3()

function Py2()
  let g:syntastic_python_python_exec = '/usr/bin/python'
endfunction

function Py3()
  let g:syntastic_python_python_exec = '/usr/bin/python3'
endfunction

call Py3() 

nmap ; :CtrlPBuffer<CR>
nmap <F8> :NERDTreeToggle<CR>
nmap <F9> :TagbarToggle<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"=====[ Highlight matches when jumping to next ]=============
" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>

function! HLNext (blinktime)
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    let target_pat = '\c\%#'.@/
    let ring = matchadd('ColorColumn', target_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    call matchdelete(ring)
    redraw
endfunction
