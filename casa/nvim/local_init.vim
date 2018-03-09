set nowrap
set noic
set bg=light

" set guifont=DroidSansMono\ Nerd\ Font\ 14
let g:airline_left_sep = "\uE0B4"
let g:airline_right_sep = "\uE0B6"
let g:airline_section_z = airline#section#create(["\uE0A1" . '%{line(".")}' . "\uE0A3" . '%{col(".")}'])

let g:airline_powerline_fonts=1
" let g:airline_theme = 'lucius'
let g:airline_theme = 'simple'

" vim-vue
augroup vimrc-vue
  autocmd!
  autocmd FileType vue set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2
augroup END

" vim-javascript
augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2
augroup END

" nmap ct <Esc>:!ctags -R --exclude=./vendor --exclude=./node_modules ./ --PHP-kinds=+cif-dvj --JavaScript-kinds=+fcmpl<CR><Esc>:!clear<CR><CR>

let g:syntastic_javascript_checkers=['eslint']
" let g:syntastic_javascript_eslint_exe = '[ -f $(npm bin)/eslint ] && $(npm bin)/eslint || eslint'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
