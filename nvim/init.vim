" vim-plug autoinstall
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
   Plug 'vim-airline/vim-airline'
   Plug 'vim-airline/vim-airline-themes'
   Plug 'dense-analysis/ale'
   Plug 'tpope/vim-fugitive'
   Plug 'junegunn/fzf', { 'do': './install --all' }
   Plug 'junegunn/fzf.vim'
   Plug 'mhinz/vim-startify'
   Plug 'tpope/vim-surround'
   Plug 'elixir-editors/vim-elixir'
   Plug 'fatih/vim-go'
   Plug 'flazz/vim-colorschemes'
   Plug 'mrk21/yaml-vim'
   Plug 'jamshedvesuna/vim-markdown-preview'
call plug#end()

"Avoiding using arrows
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

:tnoremap <Esc> <C-\><C-n>  "Use Esc to go out of terminal mode

"FZF
nnoremap <C-p> :<C-u>FZF<CR>

" Number on the left by default
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
"Seems to be broken: Wait until merged: https://github.com/fatih/vim-go/issues/2710
"let g:go_auto_sameids = 1

"Auto import dependencies"
let g:go_fmt_command = "goimports"

" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1

"Enabled gometalinter by default"
let g:ale_linters = {
\	'go': ['gometalinter', 'gofmt', 'golint'],
\	'elixir': ['elixir-ls'],
\	'Dockerfile': ['hadolint'],
\	'yml': ['prettier']
\}

" Build Golang files on save.
" This is not neede since Ale is working well
" augroup auto_go
"     autocmd!
"     autocmd BufWritePost *.go :GoBuild
" augroup end

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'json': ['prettier'],
\   'elixir': ['mix_format'],
\}

"" TODO: THis has to be modified to a valid path of elixir-ls/rel
"//www.mitchellhanberg.com/post/2018/10/18/how-to-use-elixir-ls-with-vim/ $ export VIMCONFIG=~/.config/nvim
let g:ale_elixir_elixir_ls_release = '/opt/elixir-ls/rel'

" Trying the leader keyboard
noremap <Leader>n nzz
noremap <Leader>N Nzz

" add yaml stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Ali: to indent json files on save
""autocmd FileType json autocmd BufWritePre <buffer> :%!jq .

" Load local Vim setup
if filereadable("/Users/jkrmto-paack/.config/nvim/local.vim")
	source /Users/jkrmto-paack/.config/nvim/local.vim
endif
