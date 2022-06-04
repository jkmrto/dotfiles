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
  Plug 'jparise/vim-graphql'
  Plug 'gisphm/vim-gitignore'

	Plug 'chr4/nginx.vim'

	"Elm
  Plug 'ElmCast/elm-vim'

	"Elixir
	Plug 'elixir-editors/vim-elixir'

	"Go
	Plug 'fatih/vim-go', {  'tag': 'v1.22', 'do': ':GoUpdateBinaries' }
  "Plug 'fatih/vim-go'

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
	Plug 'derekwyatt/vim-scala'

	" Go to repository line
	Plug 'ruanyl/vim-gh-line'

   "Python
	Plug 'vim-python/python-syntax'

	" Setup for nvim 0.5.0
	" Collection of common configurations for the Nvim LSP client
	Plug 'neovim/nvim-lspconfig'
	"A completion engine plugin for neovim written in Lua.
	Plug 'hrsh7th/nvim-cmp'
	" LSP completion source for nvim-cmp
	Plug 'hrsh7th/cmp-nvim-lsp'
	" Snippet completion source for nvim-cmp
	Plug 'hrsh7th/cmp-vsnip'
	" Other usefull completion sources
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-buffer'

	" Deprecated completion plugin still used for css
	Plug 'nvim-lua/completion-nvim'

	"
	Plug 'folke/trouble.nvim'
	Plug 'kyazdani42/nvim-web-devicons'

	"Rust
	Plug 'simrat39/rust-tools.nvim'
call plug#end()

"on_attach=require'completion'.on_attach,
lua << EOF
	local lsp = require'lspconfig'
	local comp = require'completion'
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true

	lsp.elixirls.setup {
		cmd = { ".elixir_ls/rel/language_server.sh" },
			settings = {
 		 	   elixirLS = {
 		 	     dialyzerEnabled = false;
				}
			}
	}
	lsp.cssls.setup {
		capabilities = capabilities,
		on_attach = comp.on_attach
	}
	lsp.html.setup {
		filetypes = { "html", "eex" }
	}
	lsp.vimls.setup{}	
EOF

lua << EOF
	require('rust-tools').setup({})
EOF


"
" Autcomplete configuration
"
" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Setup Completion
" See https://github.com/hrsh7th/nvim-cmp#basic-configuration
lua <<EOF
local cmp = require'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- enable scrolling on docs
		['<C-k>'] = cmp.mapping.scroll_docs(-4),
    ['<C-j>'] = cmp.mapping.scroll_docs(4),
		-- luanch autcomplete on <ctrl-o>
    ['<C-o>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

	-- -- disable automatic autocomplete
	--completion = {
	--	autocomplete = false
	--},

	-- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
})
EOF


" Setup for vim files"
au FileType vim set noexpandtab
au FileType vim set shiftwidth=2
au FileType vim set softtabstop=2
au FileType vim set tabstop=2

colorscheme gruvbox
let g:gruvbox_material_background = 'medium'
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_disable_italic_comment = 0

" Set :E as :Explore
cabbrev E Explore

"Leader Configuartion
nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"

noremap <leader>ag :Ag <C-r><C-w><CR>
noremap <leader>ff :<C-U>Files<CR>=expand('<cword>')

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


"Use Esc to go out of terminal mode
:tnoremap <Esc> <C-\><C-n>

"FZF
nnoremap <leader>p :<C-u>GFiles<CR>


" Number on the left by default
:set number

" tab width of 4"
au FileType javascript set noexpandtab
au FileType javascript set shiftwidth=2
au FileType javascript set softtabstop=2
au FileType javascript set tabstop=2


" tab width of 2"
au FileType *css set noexpandtab
au FileType *css set shiftwidth=2
au FileType *css set softtabstop=2
au FileType *css set tabstop=2

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

"let g:ale_completion_enabled = 1
let g:ale_open_list = 1

" Execute linter and fixer only on save
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1

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
\ }

let g:ale_fixers = {
\ 'elm': ['elm-format'],
\ 'graphql': ['prettier'],
\ 'typescript': ['prettier'],
\ 'json': ['prettier'],
\ 'jsx': ['prettier'],
\ 'javascript': ['prettier'],
\ 'rust': ['rustfmt'],
\ 'eelixir': ['remove_trailing_lines', 'trim_whitespace'],
\ }

" Apply ALE fixers on save
let g:ale_fix_on_save = 1

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

" add yaml stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" VimFugitive

" Custom VimFugitive mapping
nnoremap <Leader>is :Gstatus<CR>
nnoremap <Leader>id :Gdiffsplit<CR>
nnoremap <Leader>ib :Git blame<CR>

" Vim Markdown
"
" https://github.com/JamshedVesuna/vim-markdown-preview#requirements
"let vim_markdown_preview_github=1

" Custom tab for html
au FileType html set noexpandtab
au FileType html set shiftwidth=2
au FileType html set softtabstop=2
au FileType html set tabstop=2

" Typescripts maps:
au FileType typescript.tsx nnoremap gd :ALEGoToDefinition<CR>

augroup filetype javascript syntax=javascript
autocmd BufNewFile,BufRead *.jsx :set filetype=javascript

nmap <silent> gd <Plug>(coc-definition)

lua << EOF
local on_attach = function(client, bufnr)
buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

end
EOF

nnoremap <silent>gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <leader>h <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <leader>f <cmd>lua vim.lsp.buf.formatting_seq_sync()<CR>


"execute("edit!")
function FormatHeex()
	execute("!htmlbeautifier %")
endfunction

function FormatEex()
	execute("%!prettier --print-width=120 --stdin-filepath %")
endfunction

au FileType eelixir nnoremap <leader>fp :silent call FormatEex() <CR>

au FileType html nnoremap <leader>fp :silent call FormatEex() <CR>

au FileType eelixir nnoremap <leader>fh :silent call FormatHeex() <CR>

au FileType scss nnoremap <leader>f :silent %!prettier --stdin-filepath %<CR>


" Execute format heex on save.
" Avoid confirmation message with ':silent'
" au BufWritePost *.html.heex :silent call  FormatHeex()
" au BufWritePost *.html.eex :silent call FormatEex()



" Trouble keybindings
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle lsp_document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

" format on save
autocmd BufWritePre *.ex lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.exs lua vim.lsp.buf.formatting_sync(nil, 100)

function GetVisualSelection()
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - 2]
		let lines[0] = lines[0][column_start - 1:]
		return join(lines, "\n")
endfunction
