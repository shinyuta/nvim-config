return {
  "Wansmer/treesj",
  keys = {},
  dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
  config = function()
    require("treesj").setup({ --[[ your config ]]
      use_default_keymaps = false, -- This disables the built-in keymaps, including <space>s
    })
  end,
}
