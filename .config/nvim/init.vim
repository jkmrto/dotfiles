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

	"Colorschemes
  Plug 'flazz/vim-colorschemes'
	Plug 'EdenEast/nightfox.nvim' 

	"Nginx
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

	" Collection of common configurations for the Nvim LSP client
	Plug 'neovim/nvim-lspconfig'
	"A completion engine plugin for neovim written in Lua.
	Plug 'hrsh7th/nvim-cmp', { 'branch': 'main' }
	" LSP completion source for nvim-cmp
	Plug 'hrsh7th/cmp-nvim-lsp', { 'branch': 'main' }
	" Snippet completion source for nvim-cmp
	Plug 'hrsh7th/cmp-vsnip', { 'branch': 'main' }
	" Other usefull completion sources
	Plug 'hrsh7th/cmp-path', { 'branch': 'main' }
	Plug 'hrsh7th/cmp-buffer', { 'branch': 'main' }

	" Deprecated completion plugin still used for css
	Plug 'nvim-lua/completion-nvim'

	"
	Plug 'folke/trouble.nvim', { 'branch': 'main' }
	Plug 'kyazdani42/nvim-web-devicons'

	"Rust
	Plug 'simrat39/rust-tools.nvim'

	"Treesitter
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

	Plug 'catppuccin/nvim', {'as': 'catppuccin'}
call plug#end()

lua << EOF
	-- modules at lua/
	require('lsp')
	require('cs-nightfox')
	require('tree-sitter')
EOF


lua << EOF
	require('rust-tools').setup({})
EOF

let g:catppuccin_flavour = "mocha" " latte, frappe, macchiato, mocha
colorscheme catppuccin
"colorscheme nightfox


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
nnoremap <leader>pp :<C-u>GFiles<CR>
nnoremap <leader>ps :<C-u>GFiles?<CR>


" Number on the left by default
:set number

" VimFugitive

" Custom VimFugitive mapping
nnoremap <Leader>is :Gstatus<CR>
nnoremap <Leader>id :Gdiffsplit<CR>
nnoremap <Leader>ib :Git blame<CR>

" Vim Markdown
"
" https://github.com/JamshedVesuna/vim-markdown-preview#requirements
"let vim_markdown_preview_github=1


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
function! FormatHeex()
	execute("!htmlbeautifier %")
endfunction

function! FormatEex()
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

runtime keybindings.vim

" Trouble keybindings
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

" format on save
autocmd BufWritePre *.ex lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.exs lua vim.lsp.buf.formatting_sync(nil, 100)

function! GetVisualSelection()
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



autocmd BufNewFile,BufRead *.heex :set filetype=eelixir
