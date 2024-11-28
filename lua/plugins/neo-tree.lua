return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    -- Deprecated as of 0.10 read --> https://github.com/neovim/neovim/pull/26193
    -- vim.fn.sign_define("DiagnosticSignError", {text = " ", texthl = "DiagnosticSignError"})
    -- vim.fn.sign_define("DiagnosticSignWarn", {text = " ", texthl = "DiagnosticSignWarn"})
    -- vim.fn.sign_define("DiagnosticSignInfo", {text = " ", texthl = "DiagnosticSignInfo"})
    -- vim.fn.sign_define("DiagnosticSignHint", {text = "󰌵", texthl = "DiagnosticSignHint"})

    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.INFO] = " ",
          [vim.diagnostic.severity.HINT] = "󰌵",
        },
        linehl = {
          [vim.diagnostic.severity.ERROR] = "ErrorMsg",
        },
        numhl = {
          [vim.diagnostic.severity.ERROR] = "ErrorMsg",
          [vim.diagnostic.severity.WARN] = "WarningMsg",
          [vim.diagnostic.severity.INFO] = "InfoMsg",
          [vim.diagnostic.severity.HINT] = "HintMsg",
        },
      },
    })

    require("neo-tree").setup({
      winbar = false,
      statusline = true,
      enable_diagnostics = true,
      enable_git_status = true,
      window = {
        position = "left",
        width = 20,
      },
      auto_clean_after_session_restore = true -- Automatically clean up broken neo-tree buffers saved in sessions
    })
  end,
}
