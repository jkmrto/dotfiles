"execute("edit!")
function! FormatHeex()
	execute("!mix format %")
endfunction

autocmd FileType eelixir nnoremap <leader>fh :silent call FormatHeex() <CR>
autocmd FileType elixir nnoremap <leader>f :silent call FormatHeex() <CR>


" format on save
autocmd BufWritePre *.ex lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.exs lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.heex lua vim.lsp.buf.formatting_sync(nil, 100)

autocmd BufNewFile,BufRead *.heex :set filetype=eelixir
