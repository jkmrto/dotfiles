augroup filetype javascript syntax=javascript
autocmd BufNewFile,BufRead *.jsx :set filetype=javascript

" tab width of 4"
au FileType javascript set noexpandtab
au FileType javascript set shiftwidth=2
au FileType javascript set softtabstop=2
au FileType javascript set tabstop=2

" Manual JS formatter (prettier)
autocmd FileType js nnoremap <leader>f :silent %!prettier --stdin-filepath %<CR>

echo "Javascript setup loaded"
