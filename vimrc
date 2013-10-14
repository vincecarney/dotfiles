execute pathogen#infect()
syntax on
filetype plugin indent on

colo desert
" autocmd VimEnter * NERDTree "
autocmd FileType html setlocal shiftwidth=4 tabstop=4
cd /srv/python-environments/
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

call matchadd('ColorColumn', '\%81v', 100)

let NERDTreeIgnore = ['\.pyc$']
let g:syntastic_python_checkers=['flake8']

nmap ; :CtrlPBuffer<CR>
nmap <F8> :NERDTreeToggle<CR>
nmap <F9> :TagbarToggle<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
