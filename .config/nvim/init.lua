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
vim.api.nvim_set_keymap('n', '<leader>ho', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting_seq_sync()<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>ia', '<cmd>ChatGPT<CR>', { noremap = true })


vim.api.nvim_set_keymap('n', '<Leader>ll', ':LspLog<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>li', ':LspInfo<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<Leader>xd', ':TroubleToggle<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<Leader>xd', ':TroubleToggle<CR>', { noremap = true })


vim.api.nvim_set_keymap('n', '<Leader>ee', ':bd!<CR> :Explore!<CR>', { noremap = true })



--vim.api.nvim_set_keymap('n', 'cc', '<cmd>"*<CR>', { noremap = true })


vim.api.nvim_set_keymap('n', '<C-y>', '"y*', { noremap = true })


vim.api.nvim_set_keymap('n', '<Leader>pt', ':Etest<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>ps', ':Esource<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>ph', ':Etemplate<CR>', { noremap = true })

vim.api.nvim_set_var('projectionist_heuristics', {
  ['mix.exs|lib/*.ex'] = {
    ['lib/**/live/*_live.ex'] = {
      alternate = 'lib/{dirname}/live/{basename}_live.html.heex',
      type = 'source',
      template = {
        "defmodule {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}Live do",
        "  use {dirname|camelcase|capitalize}, :live_view",
        "",
        "  def mount(_params, _session, socket) do",
        "    {open}:ok, socket{close}",
        "  end",
        "end"
      },
    },
    ['lib/**/live/*_live.html.heex'] = {
      alternate = 'lib/{dirname}/live/{basename}_live.ex',
      type = 'template',
    },
    ['lib/*.ex'] = {
      alternate = 'test/{}_test.exs',
      type = 'source',
      template = {
        "defmodule {camelcase|capitalize|dot} do",
        "end"
      },
    },
    ['test/*_test.exs'] = {
      alternate = 'lib/{}.ex',
      type = 'test',
      template = {
        "defmodule {camelcase|capitalize|dot}Test do",
        "  use ExUnit.Case, async: true",
        "",
        "  alias {camelcase|capitalize|dot}",
        "end"
      },
    },
  },
})

