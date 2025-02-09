-- on_attach=require'completion'.on_attach,
local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")
local home = os.getenv("HOME")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- lspconfig.elixirls.setup {
-- 	capabilities = capabilities,
-- 	cmd = { "/Users/juancarlos/elixir_ls/jakebecker.elixir-ls-0.17.8/elixir-ls-release/language_server.sh" },
-- 	settings = {
-- 		elixirLS = {
-- 			dialyzerEnabled = false,
-- 			fetchDeps = false,
-- 			enableTestLenses = false,
-- 			suggestSpecs = false,
-- 		}
-- 	}
-- }

print(
  "This is the expected path to Lexical LS: "
    .. home
    .. "/language-servers/lexical/_build/dev/package/lexical/bin/start_lexical.sh"
)

-- Useful for debugging vim-lsp:
vim.g.lsp_log_verbose = 1
vim.g.lsp_log_file = vim.fn.expand("~/vim-lsp.log")

if not configs.lexical then
  configs.lexical = {
    default_config = {
      filetypes = { "elixir", "eelixir", "heex" },
      cmd = { home .. "/language-servers/lexical/_build/dev/package/lexical/bin/start_lexical.sh" },
      root_dir = function(fname)
        return lspconfig.util.root_pattern("mix.exs", ".git")(fname) or vim.loop.os_homedir()
      end,
      -- optional settings
      settings = {},
    },
  }
end

lspconfig.lexical.setup({})

lspconfig.cssls.setup({
  -- capabilities = capabilities,
  -- on_attach = comp.on_attach
})

lspconfig.html.setup({
  filetypes = { "html", "eex" },
})

lspconfig.vimls.setup({})

require("lspconfig").lua_ls.setup({
  settings = {
    Lua = {
      format = {
        -- Using Stylua as formatter
        enable = false,
      },
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
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
})

-- I end up using 'Stylua' as formatter for lua files -> https://github.com/JohnnyMorganz/StyLua
-- Config can be found at ~/.config/stylua.toml
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.lua",
  callback = function()
    local file = vim.fn.expand("%:p")
    local format_command = "stylua --config-path ~/.config/stylua.toml " .. vim.fn.shellescape(file)

    local _format_job_id = vim.fn.jobstart(format_command, {
      on_exit = function(_, code, _)
        vim.cmd("edit!")
      end,
    })
  end,
})

print("LSP setup laoded")
