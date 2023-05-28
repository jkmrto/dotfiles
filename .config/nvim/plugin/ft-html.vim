" Custom tab for html
au FileType html set noexpandtab
au FileType html set shiftwidth=2
au FileType html set softtabstop=2
au FileType html set tabstop=2

autocmd FileType html nnoremap <leader>f :silent %!prettier --stdin-filepath %<CR>

echo "Html setup loaded"


