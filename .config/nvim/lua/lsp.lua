-- on_attach=require'completion'.on_attach,
print("soy lua")
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

