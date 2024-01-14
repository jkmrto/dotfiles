local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn
-- ensure that packer is installed
local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
	execute 'packadd packer.nvim'
end
vim.cmd('packadd packer.nvim')
local packer = require 'packer'
local util = require 'packer.util'
packer.init({
	package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

--- startup and add configure plugins
packer.startup(function()
	local use = use

	use 'airblade/vim-gitgutter'
	use 'dense-analysis/ale'

	use {
		'junegunn/fzf.vim',
		requires = { 'junegunn/fzf', run = ':call fzf#install()' }
	}

	use 'tpope/vim-fugitive'

	--Colorschemes
	use 'flazz/vim-colorschemes'
	use 'EdenEast/nightfox.nvim'
	use { 'catppuccin/nvim', as = 'catppuccin' }
	use { 'rose-pine/neovim', as = 'rose-pine' }


	--Elixir
	use 'elixir-editors/vim-elixir'

	--Go
	use 'fatih/vim-go'

	-- Go to repository line
	use 'ruanyl/vim-gh-line'

	--Rust
	use 'simrat39/rust-tools.nvim'

	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	use { "tpope/vim-projectionist" }

	-- Collection of common configurations for the Nvim LSP client
	use 'neovim/nvim-lspconfig'
   	 
	-- LSP completion source for nvim-cmp
	use { 'hrsh7th/nvim-cmp', branch = 'main' }
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-nvim-lua'
	-- Other usefull completion sources
	use { 'hrsh7th/cmp-path', branch = 'main' }
	use { 'hrsh7th/cmp-buffer', branch = 'main' }

    	use 'hrsh7th/cmp-nvim-lsp-signature-help'

	-- Deprecated completion plugin still used for css
	use 'nvim-lua/completion-nvim'


	use({
		'folke/trouble.nvim',
		requires = {
			'kyazdani42/nvim-web-devicons',
		}
	}) 

	-- setup chatgpt
	use({
		"jackMort/ChatGPT.nvim",
		config = function()
			require("chatgpt").setup(defaults)
		end,
		requires = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim"
		}
	})

	--mason setup
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'

	--snippets 
	-- A completion engine plugin for neovim written in Lua.
	use { 'hrsh7th/cmp-vsnip', branch = 'main' }
	use 'hrsh7th/vim-vsnip'
	
	use "L3MON4D3/LuaSnip"

	use 'mhinz/vim-startify'

	use({
	     "iamcco/markdown-preview.nvim",
	         run = function() vim.fn["mkdp#util#install"]() end,
	         })
	

end)

print("Packer loaded")
