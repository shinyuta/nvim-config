return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},
  config = function()
    require("render-markdown").setup({
      code = {                       -- code blocks
        disable_background = { }, -- disables background (personal preference)
      },
      checkbox = {
        custom = {
          important = { raw = "[~]", rendered = "󰓎 ", highlight = "DiagnosticWarn" },
        },
      },
      pipe_table = { preset = "double" },
      heading = { border = true },
    })
  end,
}
