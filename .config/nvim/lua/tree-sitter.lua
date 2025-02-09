require("nvim-treesitter.configs").setup({
  autotag = {
    enable = true,
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  auto_install = true,
  ensure_installed = {
    "elixir",
    "vim",
    "lua",
    "rust",
    "toml",
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
})

print("Tree sitter configuration loaded")
