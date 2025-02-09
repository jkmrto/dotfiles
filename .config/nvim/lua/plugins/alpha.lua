-- This is merged into the main plugins specification (plugins/init.lua)
-- It is just a way to split the plugins config in different files

-- https://github.com/goolord/alpha-nvim
return {
  "goolord/alpha-nvim",
  -- dependencies = { 'echasnovski/mini.icons' },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local startify = require("alpha.themes.startify")
    -- available: devicons, mini, default is mini
    -- if provider not loaded and enabled is true, it will try to use another provider
    startify.file_icons.provider = "devicons"
    require("alpha").setup(startify.config)
  end,
}
