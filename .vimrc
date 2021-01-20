if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'kien/ctrlp.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter'
call plug#end()

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|tags|dist|'

colorscheme desert
filetype plugin indent on
set autochdir
set exrc
set guicursor=
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
  set statusline+=\ [%n
  set statusline+=\/%{len(filter(range(1,bufnr('$')),'buflisted(v:val)'))}]
endif

map <F5> :source ~/.vimrc<CR>

" Lexplore
map <C-\> :Lex <bar> vertical resize 30<Cr>
let g:netrw_liststyle = 3 " mostra como uma tree
let g:netrw_banner = 0 " remove o topo
let g:netrw_list_hide= '.*\.swp$,.*\.pyc,.*\.git,node_modules,tags' " exclui arquivos e diretorios

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

" vim-javascript
augroup vimrc-sql
    autocmd!
    autocmd FileType sql set tabstop=4 | set shiftwidth=4 |
    set expandtab softtabstop=4
augroup END

" deleta espaços e outros caracteres do arquivo
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\t\+$//e
autocmd BufWritePre * %s/$//e
autocmd BufWritePre * %s///e

" reconfigura a tabulacao do codigo em sql
autocmd FileType sql silent! %retab
" autocmd FileType sql silent! %s/$//e

" executa na abertura do arquivo uma sincronizacao da syntax do codigo
autocmd FileType javascript|vue %syntax sync fromstart

highlight VertSplit cterm=NONE
" set fillchars+=vert:\

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')
" set signcolumn=yes
" autocmd BufEnter * sign define dummy
" autocmd BufRead,BufNewFile * setlocal signcolumn=yes
highlight clear SignColumn
highlight! link SignColumn LineNr
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
