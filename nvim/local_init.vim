let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim')
Plug 'kien/ctrlp.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
Plug 'machakann/vim-highlightedyank'
Plug 'vim-scripts/AutoComplPop'
Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/CSApprox'

"*****************************************************************************
"" Custom bundles
"*****************************************************************************

" c
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
Plug 'ludwig/split-manpage.vim'


" html
"" HTML Bundle
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'


" javascript
"" Javascript Bundle
Plug 'jelera/vim-javascript-syntax'


" php
"" PHP Bundle
Plug 'arnaud-lb/vim-php-namespace'


" python
"" Python Bundle
Plug 'davidhalter/jedi-vim'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}
call plug#end()

colorscheme gruvbox
let g:gruvbox_termcolors=16
set bg=dark

filetype plugin indent on
set autochdir
set autoindent
set autoread
set backspace=indent,eol,start
set clipboard=unnamedplus
set cmdheight=2
set display=lastline
set encoding=UTF-8
set expandtab
set exrc
set ffs=unix,dos,mac
set fileencodings=utf-8
set guicursor=
set hidden
set hlsearch is
set ignorecase
set inccommand=split
set incsearch
set laststatus=2
set lazyredraw
set linebreak
set list
set nocompatible
set nowrap
set number
set regexpengine=1
set relativenumber
set ruler
set shiftround
set shiftwidth=2
set shortmess+=c
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
set updatetime=300
set wildmenu
set wildmode=longest:list,full
set wrapscan

if has("syntax")
  syntax on
endif

map <F5> :source ~/.config/nvim/init.vim<Cr>
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" ident
xnoremap < <gv
xnoremap > >gv

" leader key is \
nnoremap <leader>n :bn<cr>
nnoremap <leader>p :bp<cr>
nnoremap <leader>sv :vsplit<cr>
nnoremap <leader>sh :split<cr>

autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\t\+$//e
autocmd BufWritePre * %s/$//e
autocmd BufWritePre * %s///e

" vim-javascript
augroup vimrc-rest
  autocmd!
  autocmd FileType rest set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2
augroup END

" vim-javascript
augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2
augroup END

" vim-vue
augroup vimrc-vue
  autocmd!
  autocmd FileType vue set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2
augroup END

nmap <silent> <C-j>t :!ctags -R --exclude=./vendor --exclude=./node_modules ./ --PHP-kinds=+cif-dvj --JavaScript-kinds=+fcmp-v<CR><Esc>:!clear<CR><CR>

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

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|dist|tags|'

" Lexplore
map <C-\> :Lex <bar> vertical resize 30<Cr>
let g:netrw_liststyle = 3 " mostra como uma tree
let g:netrw_banner = 0 " remove o topo
let g:netrw_list_hide= '.*\.swp$,.*\.pyc,.*\.git,node_modules,tags' " exclui arquivos e diretorios

if empty($TMUX)
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
else
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
endif

" -------
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

set listchars=tab:>~,nbsp:_,trail:.
" -------

autocmd FileType sql silent! %retab
highlight VertSplit cterm=NONE

" ------- mudar a cor da barra lateral esquerda do vim
highlight clear SignColumn
highlight! link SignColumn LineNr
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
" -------

" let NERDTreeIgnore = ['node_modules', 'dist', 'tags']
"
" let g:vrc_curl_opts = {
"       \ '-s': '',
"       \ '-S': '',
"       \ '-4': '',
"       \ '-k': '',
"       \ '--compressed': '',
"       \ '--location': '',
"       \}
"
" let g:vrc_response_default_content_type = 'application/json'
"
" " deixar transparente o editor
" hi Normal guibg=NONE ctermbg=NONE
"
" let g:airline_powerline_fonts = 1
" " let g:airline_theme = 'badwolf'
"
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%{FugitiveStatusline()}
" set statusline+=%*
"
" let g:syntastic_javascript_checkers=['eslint']
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
