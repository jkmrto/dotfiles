require('packer-setup')
require('lsp')
require('cs-nightfox')
require('tree-sitter')
require('trouble-setup')
require('colorscheme-setup')

-- require('rust-tools').setup({})
vim.api.nvim_set_keymap('n', '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = " "

--Set :E as :Explore
vim.cmd('cabbrev E Explore')

-- search for workd that is currently on the cursor
vim.api.nvim_set_keymap('n', '<leader>ag', ':Ag <C-r><C-w><CR>', { noremap = true })
--Search for files mappings
vim.api.nvim_set_keymap('n', '<leader>pp', ':<C-u>GFiles<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ps', ':<C-u>GFiles?<CR>', { noremap = true })
-- search for files (this command is not working)
-- vim.api.nvim_set_keymap('n', '<leader>ff', "<cmd>lua vim.cmd(':Files ' .. vim.fn.expand('<cword>'))<CR>", { noremap = true, silent = true })
vim.env["FZF_DEFAULT_OPTS"] = "--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"



--Navigate through vim configuration
vim.api.nvim_set_keymap('n', '<leader>vv', ':e ~/.config/nvim/init.lua<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>vs', ':source %<CR>', { noremap = true })

--Split buffers and terminal
vim.api.nvim_set_keymap('n', '<leader>sv', ':vert split<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ss', ':split<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>tt', ':term<CR>', { noremap = true })

--Disable navigating through arrors
vim.api.nvim_set_keymap('n', '<Up>', '<Nop>', { silent = true })
vim.api.nvim_set_keymap('n', '<Down>', '<Nop>', { silent = true })
vim.api.nvim_set_keymap('n', '<Left>', '<Nop>', { silent = true })
vim.api.nvim_set_keymap('n', '<Right>', '<Nop>', { silent = true })

-- Some settings
vim.o.updatetime = 100
vim.o.number = true
vim.o.splitbelow = true
vim.o.splitright = true

--Use Esc to go out of terminal mode
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true })

-- VimFugitive keybindings
vim.api.nvim_set_keymap('n', '<Leader>is', ':Gstatus<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>ib', ':Git blame<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>id', ':Git diff %<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>iu', ':Git restore --staged %<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>ia', ':Git add %<CR>', { noremap = true })


-- Some LSP keybindings
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>h', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting_seq_sync()<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>ia', '<cmd>ChatGPT<CR>', { noremap = true })
