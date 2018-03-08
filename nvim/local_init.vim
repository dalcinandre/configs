set list listchars=tab:⟶\ ,trail:.

set hidden
set nowrap
set noic
set bg=light
set inccommand=split
set fileencodings=utf-8

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

" nmap ct <Esc>:!ctags -R --exclude=./vendor --exclude=./node_modules ./ --PHP-kinds=+cif-dvj --JavaScript-kinds=+fcmp-v<CR><Esc>:!clear<CR><CR>

let g:airline_powerline_fonts = 1
let g:airline_theme = 'badwolf'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
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

" inoremap <up> <ESC> :echoerr 'Use k to up'<CR>
" inoremap <down> <ESC> :echoerr 'Use j to down'<CR>
" inoremap <left> <ESC> :echoerr 'Use h to left'<CR>
" inoremap <right> <ESC> :echoerr 'Use l to right'<CR>
