require 'nvim-treesitter.configs'.setup {
	autotag = {
		enable = true,
	},
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = true,
		disable = {},
	},
	ensure_installed = {
		"elixir",
		"vim",
		"lua"
	},
}



print("Tree sitter configuration loaded")
