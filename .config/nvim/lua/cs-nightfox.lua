--  Setup -> https://github.com/EdenEast/nightfox.nvim
local palettes = {
  -- Everything defined under `all` will be applied to each style.
  all = {
    -- Each palette defines these colors:
    --   black, red, green, yellow, blue, magenta, cyan, white, orange, pink
    --
    -- These colors have 3 shades: base, bright, and dim
    --
    -- Defining just a color defines it's base color
    green = "#AFE1AF",
  },
}

require("nightfox").setup({ palettes = palettes })

print("Colorschema nightfox loaded")
