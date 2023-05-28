au FileType *css set noexpandtab
au FileType *css set shiftwidth=2
au FileType *css set softtabstop=2
au FileType *css set tabstop=2

" CSS formatter 
autocmd FileType scss nnoremap <leader>f :silent %!prettier --stdin-filepath %<CR>

echo "CSS setup loaded"
