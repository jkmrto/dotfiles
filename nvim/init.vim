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
   Plug 'airblade/vim-gitgutter'
call plug#end()

colorscheme gruvbox

"Leader Configuartion
nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"

"Reduce update time based on vim-gitgutter readme
set updatetime=100

"Open nvim config file on current buffer
nnoremap <Leader>v :e ~/.config/nvim/init.vim<CR>

"Avoid using arrows
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"Modify split behaviour
set splitbelow
set splitright

" Allow navigation on one key stroke
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Use Esc to go out of terminal mode
:tnoremap <Esc> <C-\><C-n>

"FZF
nnoremap <C-p> :<C-u>FZF<CR>

" Number on the left by default
:set number


"VIM-Go Setup"

" tab width of 4"
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

" Map keys to GoDecls
au FileType go nnoremap <buffer> <C-d> :GoDecls<cr>
au FileType go nnoremap <buffer> <C-g> :GoDeclsDir<cr>
au FileType go nnoremap <Leader>i :GoSameIdsToggle<CR>

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
let g:go_fmt_command = "goimports"


" ALE configuration

nnoremap <Leader>a :ALEToggle<CR>

" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:ale_set_signs = 1

" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

let g:ale_completion_enabled = 1
let g:ale_open_list = 1

" Execute linter and fixer only on save
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

"Use Quickfix list instead of Loclist
let g:ale_set_quickfix = 1
let g:ale_set_loclist = 0

" Avoid golint and go vet by default to avoid style warnings
"'go': ['go build', 'gofmt', 'golint', 'go vet'],
let g:ale_linters = {
\	'go': ['go build', 'go vet', 'golint'],
\	'elixir': ['elixir-ls'],
\	'Dockerfile': ['hadolint'],
\	'yml': ['yamllint'],
\	'yaml': ['yamllint'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'json': ['prettier'],
\   'yaml': ['prettier'],
\   'yml': ['prettier'],
\   'elixir': ['mix_format'],
\}

" TODO: THis has to be modified to a valid path of elixir-ls/rel
"//www.mitchellhanberg.com/post/2018/10/18/how-to-use-elixir-ls-with-vim/ $ export VIMCONFIG=~/.config/nvim
let g:ale_elixir_elixir_ls_release = expand('$HOME/opt/elixir-ls/rel')

" add yaml stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Ali: to indent json files on save
""autocmd FileType json autocmd BufWritePre <buffer> :%!jq .

" VimFugitive

" Custom mapping
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiffsplit<CR>

" Vim Markdown
"
" https://github.com/JamshedVesuna/vim-markdown-preview#requirements
let vim_markdown_preview_github=1

" Load local Vim setup
if filereadable("/Users/jkrmto-paack/.config/nvim/local.vim")
	source /Users/jkrmto-paack/.config/nvim/local.vim
endif
