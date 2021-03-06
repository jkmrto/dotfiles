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
  Plug 'airblade/vim-gitgutter'
	Plug 'dense-analysis/ale'

  Plug 'flazz/vim-colorschemes'
  Plug 'jamshedvesuna/vim-markdown-preview'
  Plug 'junegunn/fzf', { 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'mhinz/vim-startify'
  Plug 'mrk21/yaml-vim'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ElmCast/elm-vim'
  Plug 'jparise/vim-graphql'
  Plug 'gisphm/vim-gitignore'

	"Go
	Plug 'fatih/vim-go', {  'tag': 'v1.22', 'do': ':GoUpdateBinaries' }
  "Plug 'fatih/vim-go'

  " Elixir
  Plug 'slashmili/alchemist.vim'
  Plug 'elixir-editors/vim-elixir'

  " Typescript
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'

  "Javascript
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'

  "Ruby
  Plug 'vim-ruby/vim-ruby'
  Plug 'tpope/vim-rails'

  "scala
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'derekwyatt/vim-scala'

	" Go to repository line
	Plug 'ruanyl/vim-gh-line'

   "python
	Plug 'vim-python/python-syntax'
call plug#end()

" Setup for vim files"
au FileType vim set noexpandtab
au FileType vim set shiftwidth=2
au FileType vim set softtabstop=2
au FileType vim set tabstop=2

colorscheme gruvbox

" Set :E as :Explore
cabbrev E Explore

"Leader Configuartion
nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"

noremap <leader>ag :Ag <C-r>=expand('<cword>')<CR><CR>

"Open nvim config file on current buffer
imap <c-o> <c-x><c-o><c-p>

"Navigate through vim configuration
noremap <leader>vv :e ~/.config/nvim/init.vim<CR>
noremap <leader>vs :source %<CR>

noremap <leader>sv :vert split<CR>
noremap <leader>ss :split<CR>
noremap <leader>tt :term<CR>

"Reduce update time based on vim-gitgutter readme
set updatetime=100


" Quick fix mapping
nnoremap <Leader>n :cnext<CR>
nnoremap <Leader>b :cprevious<CR>

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
nnoremap <leader>p :<C-u>FZF<CR>

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
" ALE configuration

nnoremap <Leader>aa :ALEToggle<CR>
nnoremap <Leader>ad :ALEGoToDefinition<CR>
nnoremap <Leader>ai :ALEInfo<CR>

" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:ale_set_signs = 1

" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

let g:ale_completion_enabled = 1
let g:ale_open_list = 1

" Execute linter and fixer only on save
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_linters_explicit = 1

"Use Quickfix list instead of Locactionlist
let g:ale_set_quickfix = 1
let g:ale_set_loclist = 0

" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

" Enable GoRename
" https://github.com/fatih/vim-go/issues/2366
let g:go_rename_command = 'gopls'

" Avoid golint and go vet by default to avoid style warnings
"'go': ['go build', 'gofmt', 'golint', 'go vet'],
let g:ale_linters = {
\	'Dockerfile': ['hadolint'],
\	'elm': ['elm_ls'],
\	'go': ['go build', 'go vet', 'golint'],
\	'graphql': ['gqlint'],
\	'yaml': ['yamllint'],
\ 'typescript': ['tsserver'],
\ 'javascript'  : ['eslint'],
\ 'json': ['prettier'],
\ }

"\   'yaml': ['prettier'],
let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ 'elixir': ['mix_format'],
\ 'elm': ['elm-format'],
\ 'graphql': ['prettier'],
\ 'typescript': ['prettier'],
\ 'json': ['prettier'],
\ 'javascript': ['prettier'],
\ 'rust': ['rustfmt'],
\ }

" Java linter
let g:ale_linters.java = ["javalsp"]

" Python setup
let g:ale_linters.python = ['pyls', 'flake8']
let g:ale_fixers.python = ['autopep8', 'isort', 'remove_trailing_lines', 'trim_whitespace', 'yapf']
let g:ale_virtualenv_dir_names = ['venv']
au FileType python nnoremap gd :ALEGoToDefinition<CR>

" Elixir-ls linter setup
function InstallElixirLs()
	if isdirectory('.elixir_ls') | execute("!rm -rf .elixir_ls") | endif
	execute("!git clone https://github.com/JakeBecker/elixir-ls.git .elixir_ls")
	execute("!cd .elixir_ls; mix deps.get; mix compile")
	execute("!cd .elixir_ls; mix elixir_ls.release -o rel")
endfunction

if filereadable("mix.exs")
	echo "mix.exs found. Checking elixir_ls is available"
	if !isdirectory('.elixir_ls')
		echo "ElixirLs will be installed"
		call InstallElixirLs()
	else
		echo "ElixirLs is available"
	endif
endif

" Elixir ALE setup
let g:ale_linters.elixir = ['elixir-ls' ]
let g:ale_fixers.elixir = [ 'mix_format' ]
let g:ale_elixir_elixir_ls_release = eval("getcwd()") . "/.elixir_ls/rel"
let g:ale_elixir_elixir_ls_config = { 'elixirLS': { 'dialyzerEnabled': v:false } }
autocmd FileType elixir,eelixir nnoremap gd :ALEGoToDefinition<CR>

" add yaml stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Ali: to indent json files on save
""autocmd FileType json autocmd BufWritePre <buffer> :%!jq .

" VimFugitive

" Custom VimFugitive mapping
nnoremap <Leader>is :Gstatus<CR>
nnoremap <Leader>id :Gdiffsplit<CR>
nnoremap <Leader>ib :Gblame<CR>

" Faster save
nnoremap <Leader>w :w<CR>
" Vim Markdown
"
" https://github.com/JamshedVesuna/vim-markdown-preview#requirements
"let vim_markdown_preview_github=1

" Load local Vim setup
if filereadable("/Users/jkrmto-paack/.config/nvim/local.vim")
	source /Users/jkrmto-paack/.config/nvim/local.vim
endif

" Custom tab for html
au FileType html set noexpandtab
au FileType html set shiftwidth=2
au FileType html set softtabstop=2
au FileType html set tabstop=2

" Typescripts maps:
au FileType typescript.tsx nnoremap gd :ALEGoToDefinition<CR>

augroup filetype javascript syntax=javascript
autocmd BufNewFile,BufRead *.jsx :set filetype=javascript

"let vim_markdown_preview_github=1
" let vim_markdown_preview_use_xdg_open=1
" let vim_markdown_preview_browser='Mozilla Firefox'
" let vim_markdown_preview_hotkey='<C-m>'
 "let vim_markdown_preview_toggle=3
