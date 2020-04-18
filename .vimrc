if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'kien/ctrlp.vim'
call plug#end()

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

colorscheme desert
filetype plugin indent on
set autochdir
set autoindent
set backspace=indent,eol,start
set clipboard=unnamedplus
set display=lastline
set encoding=UTF-8
set expandtab
set ffs=unix,dos,mac
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set linebreak
set list
set nocompatible
set nowrap
set number
" set path+=**
set ruler
set shiftround
set shiftwidth=2
set showcmd
set showmatch
set showmode
set smartcase
set smartindent
set smarttab
set softtabstop=2
set splitbelow
set splitright
set statusline=%=%m\ %c\ %P\ %f
set textwidth=100
set ttyfast
set wildmenu
set wildmode=longest:list,full
set wrapscan
set bg=light
syntax on
set relativenumber

autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s///e

nnoremap <leader>n :bn<cr>
nnoremap <leader>p :bp<cr>
nnoremap <leader>vs :vsplit<cr>
nnoremap <leader>hs :split<cr>

xnoremap < <gv
xnoremap > >gv

if empty($TMUX)
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
else
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
endif

if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

" vim-javascript
augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2
augroup END
