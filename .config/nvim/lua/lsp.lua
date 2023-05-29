-- on_attach=require'completion'.on_attach,
local lsp = require 'lspconfig'
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp.elixirls.setup {
	capabilities = capabilities,
	cmd = { ".elixir_ls/rel/language_server.sh" },
	settings = {
		elixirLS = {
			dialyzerEnabled = false,
		}
	}
}
lsp.cssls.setup {
	--	capabilities = capabilities,
	-- on_attach = comp.on_attach
}
lsp.html.setup {
	filetypes = { "html", "eex" }
}
lsp.vimls.setup {}


require 'lspconfig'.lua_ls.setup {
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim' },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
}







-- command = "lua vim.lsp.buf.formatting_sync(nil, 100)"
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*lua",
	command = "lua vim.lsp.buf.format()"
})
