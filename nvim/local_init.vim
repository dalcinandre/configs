if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set encoding=UTF-8

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|dist|tags|'
let NERDTreeIgnore = ['node_modules', 'dist', 'tags']

let g:vrc_curl_opts = {
      \ '-s': '',
      \ '-S': '',
      \ '-4': '',
      \ '-k': '',
      \ '--compressed': '',
      \ '--location': '',
      \}

let g:vrc_response_default_content_type = 'application/json'

" set list listchars=tab:⟶\ ,trail:.

set relativenumber
" set regexpengine=1
map <F5> :source ~/.vimrc<Cr>
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

set autoread
set hidden
set nowrap
" set noic
set bg=light
set inccommand=split
set fileencodings=utf-8

" set path+=**
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\t\+$//e
autocmd BufWritePre * %s/$//e
autocmd BufWritePre * %s///e

" autoindent code
set smartindent
" autocmd BufWritePre * silent! normal gg=G

" deixar transparente o editor
hi Normal guibg=NONE ctermbg=NONE

set ttyfast
" set cursorline
set nocursorline
set hls

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

" nmap <C-j>t <Esc>:!ctags -R --exclude=./vendor --exclude=./node_modules ./ --PHP-kinds=+cif-dvj --JavaScript-kinds=+fcmp-v<CR><Esc>:!clear<CR><CR>
nmap <silent> <C-j>t :!ctags -R --exclude=./vendor --exclude=./node_modules ./ --PHP-kinds=+cif-dvj --JavaScript-kinds=+fcmp-v<CR><Esc>:!clear<CR><CR>

let g:airline_powerline_fonts = 1
" let g:airline_theme = 'badwolf'
colorscheme gruvbox
set bg=dark

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%{FugitiveStatusline()}
set statusline+=%*

let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" noremap <up> :echoerr 'Use k to up'<CR>
" noremap <down> :echoerr 'Use j to down'<CR>
" noremap <left> :echoerr 'Use h to left'<CR>
" noremap <right> :echoerr 'Use l to right'<CR>
"
" inoremap <up> <ESC> :echoerr 'Use k to up'<CR>
" inoremap <down> <ESC> :echoerr 'Use j to down'<CR>
" inoremap <left> <ESC> :echoerr 'Use h to left'<CR>
" inoremap <right> <ESC> :echoerr 'Use l to right'<CR>
