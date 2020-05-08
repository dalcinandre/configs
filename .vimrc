if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'kien/ctrlp.vim'
" Plug 'diepm/vim-rest-console'
call plug#end()

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" curl rest
" let g:vrc_curl_opts = {
"             \ '-s': '',
"             \ '-S': '',
"             \ '-4': '',
"             \ '-k': '',
"             \ '--compressed': '',
"             \ '--location': '',
"             \}

colorscheme desert
filetype plugin indent on
set autochdir
set autoindent
set autoread
set backspace=indent,eol,start
set bg=light
set clipboard=unnamedplus
set cmdheight=1
set display=lastline
set encoding=UTF-8
set expandtab
set ffs=unix,dos,mac
set hidden
set hlsearch is
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set linebreak
set list
set nocompatible
set nowrap
set number
set relativenumber
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
set textwidth=100
set ttyfast
set wildmenu
set wildmode=longest:list,full
set wrapscan
syntax on
" set path+=**
" set colorcolumn=81
" set spelllang=en_us,pt_br
" set spell

" statusline
if has("statusline")
  set statusline=
  " set statusline+=%#PmenuSel#
  set statusline+=%#LineNr#
  set statusline+=\ %M
  set statusline+=\ %r
  set statusline+=\ %F
  set statusline+=\ %m
  set statusline+=%=
  set statusline+=\ %y
  set statusline+=\ [%{&fileencoding?&fileencoding:&encoding}]
  set statusline+=\ [%{&fileformat}]
  set statusline+=\ %c:%l/%L
  set statusline+=\ %p%%
  set statusline+=\ [%n]
endif

map <F5> :source ~/.vimrc<CR>

" Lexplore
map <C-\> :Lex <bar> vertical resize 30<Cr>
let g:netrw_liststyle = 3 " mostra como uma tree
let g:netrw_banner = 0 " remove o topo
let g:netrw_list_hide= '.*\.swp$,.*\.pyc,.*\.git,node_modules' " exclui arquivos e diretorios

" leader key is \
nnoremap <leader>n :bn<cr>
nnoremap <leader>p :bp<cr>
nnoremap <leader>sv :vsplit<cr>
nnoremap <leader>sh :split<cr>

execute "set <M-h>=\eh"
nnoremap <M-h> :vertical resize +2<cr>
execute "set <M-l>=\el"
nnoremap <M-l> :vertical resize -2<cr>

execute "set <M-j>=\ej"
nnoremap <M-j> :resize +2<cr>
execute "set <M-k>=\ek"
nnoremap <M-k> :resize -2<cr>

" ident
xnoremap < <gv
xnoremap > >gv

" move lines
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

if empty($TMUX)
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
else
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
endif

if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

" vim-javascript
augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript set tabstop=2 | set shiftwidth=2 |
  set expandtab softtabstop=2
augroup END

" deleta espaços e outros caracteres to arquivo
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s///e
autocmd BufWritePre * %s/$//e

highlight VertSplit cterm=NONE
" set fillchars+=vert:\

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)
