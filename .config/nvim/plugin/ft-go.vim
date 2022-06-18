"VIM-Go Setup"

" tab width of 4"
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

" Map keys to GoDecls
au FileType go nnoremap <buffer> <C-d> :GoDecls<cr>
au FileType go nnoremap <buffer> <C-g> :GoDeclsDir<cr>
au FileType go nnoremap <leader>gd :GoDefType<cr>
"au FileType go nnoremap <Leader>gi :GoSameIdsToggle<CR>
let g:go_auto_sameids = 0
au FileType go nnoremap <Leader>ga :GoAlternate<CR>
au FileType go nnoremap <Leader>gc :GoCoverageToggle<CR>
au FileType go nnoremap <Leader>gr :GoRename<CR>

"Hightlight everything"
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
"let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_methods = 1
"let g:go_auto_sameids = 1

"Auto import dependencies"
"let g:go_fmt_command = "goimports"
let g:go_fmt_command = "gofumports"

let g:go_fmt_options = {
    \ 'gofmt': '-s',
    \ }

"Use this option to auto |:GoFmt| on save
let g:go_fmt_autosave = 1
"Disable showing a location list when |'g:go_fmt_command'| fails
"ALE is in charge of getting the errors on save.
let g:go_fmt_fail_silently = 1

let g:go_build_tags  = "infra rabbit"

" Enable GoRename
" https://github.com/fatih/vim-go/issues/2366
let g:go_rename_command = 'gopls'

echo "Go setup loaded"
