return {
	"github/copilot.vim",

	'airblade/vim-gitgutter',
	'dense-analysis/ale',

	{
		'junegunn/fzf.vim',
		dependencies = { 'junegunn/fzf', build = ':call fzf#install()' }
	},

	'tpope/vim-fugitive',

	--Colorschemes 'flazz/vim-colorschemes',
	'EdenEast/nightfox.nvim',
	{ 'catppuccin/nvim', as = 'catppuccin' },
	{ 'rose-pine/neovim', as = 'rose-pine' },


	--Elixir
	'elixir-editors/vim-elixir',

	--Go
	'fatih/vim-go',

	-- Go to repository line
	'ruanyl/vim-gh-line',

	--Rust
	'simrat39/rust-tools.nvim',

	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

	{ "tpope/vim-projectionist" },

	-- Collection of common configurations for the Nvim LSP client
	{'neovim/nvim-lspconfig', tag = 'v0.1.8'},
   	 
	-- LSP completion source for nvim-cmp
	{ 'hrsh7th/nvim-cmp', branch = 'main' },
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-nvim-lua',
	-- Other usefull completion sources
	{ 'hrsh7th/cmp-path', branch = 'main' },
	{ 'hrsh7th/cmp-buffer', branch = 'main' },

    	'hrsh7th/cmp-nvim-lsp-signature-help',

	-- Deprecated completion plugin still used for css
	'nvim-lua/completion-nvim',

	({
		'folke/trouble.nvim',
		dependencies = {
			'kyazdani42/nvim-web-devicons',
		}
	}), 

	-- setup chatgpt
	({
		"jackMort/ChatGPT.nvim",
		config = function()
			require("chatgpt").setup(defaults)
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim"
		}
	}),

	--mason setup
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	
	--snippets 
	-- A completion engine plugin for neovim written in Lua.
	{ 'hrsh7th/cmp-vsnip', branch = 'main' },
	'hrsh7th/vim-vsnip',
	
	'L3MON4D3/LuaSnip',

	({ "iamcco/markdown-preview.nvim",  build = function() vim.fn["mkdp#util#install"]() end}),
}


