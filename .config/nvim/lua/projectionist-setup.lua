vim.api.nvim_set_keymap("n", "<Leader>pt", ":Etest<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>ps", ":Esource<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>ph", ":Etemplate<CR>", { noremap = true })

vim.api.nvim_set_var("projectionist_heuristics", {
  ["mix.exs|lib/*.ex"] = {
    ["lib/**/live/*_live.ex"] = {
      alternate = "lib/{dirname}/live/{basename}_live.html.heex",
      type = "source",
      template = {
        "defmodule {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}Live do",
        "  use {dirname|camelcase|capitalize}, :live_view",
        "",
        "  def mount(_params, _session, socket) do",
        "    {open}:ok, socket{close}",
        "  end",
        "end",
      },
    },
    ["lib/**/live/*_live.html.heex"] = {
      alternate = "lib/{dirname}/live/{basename}_live.ex",
      type = "template",
    },
    ["lib/*.ex"] = {
      alternate = "test/{}_test.exs",
      type = "source",
      template = {
        "defmodule {camelcase|capitalize|dot} do",
        "end",
      },
    },
    ["test/*_test.exs"] = {
      alternate = "lib/{}.ex",
      type = "test",
      template = {
        "defmodule {camelcase|capitalize|dot}Test do",
        "  use ExUnit.Case, async: true",
        "",
        "  alias {camelcase|capitalize|dot}",
        "end",
      },
    },
  },
})

print("Projectionist loaded")
