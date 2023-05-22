lua << EOF
	-- modules at lua/
	require('packer-setup')
	require('lsp')
	require('cs-nightfox')
	require('tree-sitter')
EOF


lua << EOF
	-- require('rust-tools').setup({})
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
nnoremap <Leader>ib :Git blame<CR>
nnoremap <Leader>id :Git diff %<CR>
nnoremap <Leader>iu :Git restore --staged %<CR>

nnoremap <Leader>ia :Git add %<CR>

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
	execute("!mix format %")
endfunction

function! FormatEex()
	execute("%!prettier --print-width=120 --stdin-filepath %")
endfunction

autocmd FileType eelixir nnoremap <leader>fp :silent call FormatEex() <CR>

autocmd FileType html nnoremap <leader>fp :silent call FormatEex() <CR>

autocmd FileType eelixir nnoremap <leader>fh :silent call FormatHeex() <CR>

autocmd FileType elixir nnoremap <leader>f :silent call FormatHeex() <CR>

autocmd FileType scss nnoremap <leader>f :silent %!prettier --stdin-filepath %<CR>

autocmd FileType js nnoremap <leader>f :silent %!prettier --stdin-filepath %<CR>


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
" autocmd BufWritePre *.ex lua vim.lsp.buf.formatting_sync(nil, 100)
" autocmd BufWritePre *.exs lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.heex lua vim.lsp.buf.formatting_sync(nil, 100)

autocmd BufNewFile,BufRead *.heex :set filetype=eelixir
