" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
    Plug 'scrooloose/nerdtree'
    Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'dense-analysis/ale'
	Plug 'fatih/vim-go'
	Plug 'tpope/vim-fugitive'
call plug#end()

:tnoremap <Esc> <C-\><C-n>  "Use Exc to go out of terminal mode

:set number

"Go Setup"
"tab width of 4"
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

"Hightlight everything"
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highligth_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

"Highligh variables with the same name"
let g:go_auto_sameids = 1

"Auto import dependencies"
let g:go_fmt_command = "goimports"

" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

"Auto imports"
let g:go_fmt_command = "goimports"
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1

"Enabled gometalinter by default"
let g:ale_linters = {'go': ['gometalinter', 'gofmt', 'golint']}
