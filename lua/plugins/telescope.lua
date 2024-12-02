return {
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      
      -- previous color #A9DD48
      local TelescopePrompt = {
        TelescopePromptTitle = {
          fg = "#A9DD48",
          bg = "none",
        },
        TelescopePreviewTitle = {
          fg = "#A9DD48",
          bg = "none",
        },
        TelescopeResultsTitle = {
          fg = "#A9DD48",
          bg = "none",
        },
        TelescopePromptBorder = {
          fg = "#A9DD48",
          bg = "none",
        },
        TelescopePreviewBorder = {
          fg = "#A9DD48",
          bg = "none",
        },
        TelescopeResultsBorder = {
          fg = "#A9DD48",
          bg = "none",
        },
      }
      for hl, col in pairs(TelescopePrompt) do
        vim.api.nvim_set_hl(0, hl, col)
      end

    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    lazy = false,
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
  {
    "dimaportenko/telescope-simulators.nvim",
    lazy = false,
    config = function()
      require("simulators").setup({
        android_emulator = false,
        apple_simulator = true,
      })
    end,
  },
}
