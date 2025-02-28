return {
  "echasnovski/mini.nvim",
  version = "*",
  config = function()
    require("mini.statusline").setup({
      use_icons = true,
      content = {
        active = function()
          local mode = MiniStatusline.section_mode({ trunc_width = 120 })

          local current_mode = vim.fn.mode()
          local hl = ""

          if current_mode == "n" then
            hl = "%#MiniStatuslineModeNormal#"
          elseif current_mode == "i" then
            hl = "%#MiniStatuslineModeInsert#"
          elseif current_mode == "v" or current_mode == "V" or current_mode == "" then
            hl = "%#MiniStatuslineModeVisual#"
          elseif current_mode == "R" then
            hl = "%#MiniStatuslineModeReplace#"
          elseif current_mode == "c" then
            hl = "%#MiniStatuslineModeCommand#"
          elseif current_mode == "t" then
            hl = "%#MiniStatuslineModeTerminal#"
          end

          return table.concat({
            hl .. mode .. "%*",
            "  ",
            MiniStatusline.section_filename({ trunc_width = 140 }),
            "%=",
            MiniStatusline.section_fileinfo({ trunc_width = 120 }),
            "  ",
            MiniStatusline.section_location({ trunc_width = 75 }),
          })
        end,
      },
    })

    -- Transparent backgrounds
    vim.api.nvim_set_hl(0, "StatusLine", { bg = "none", fg = "#d8dee9" })
    vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none", fg = "#5c6370" })
    vim.api.nvim_set_hl(0, "StatusLineTerm", { bg = "none", fg = "#d8dee9" })
    vim.api.nvim_set_hl(0, "StatusLineTermNC", { bg = "none", fg = "#5c6370" })

    -- Mode-specific text colors (text only, no backgrounds)
    vim.api.nvim_set_hl(0, "MiniStatuslineModeNormal", { fg = "#54C1DB", bg = "none", bold = true })
    vim.api.nvim_set_hl(0, "MiniStatuslineModeInsert", { fg = "#A9DD48", bg = "none", bold = true })
    vim.api.nvim_set_hl(0, "MiniStatuslineModeVisual", { fg = "#FD77DD", bg = "none", bold = true })
    vim.api.nvim_set_hl(0, "MiniStatuslineModeReplace", { fg = "#ff3045", bg = "none", bold = true })
    vim.api.nvim_set_hl(0, "MiniStatuslineModeCommand", { fg = "#f5dd58", bg = "none", bold = true })
    vim.api.nvim_set_hl(0, "MiniStatuslineModeTerminal", { fg = "#A9DD48", bg = "none", bold = true })

    -- Transparent center section (filename)
    vim.api.nvim_set_hl(0, "MiniStatuslineFilename", { fg = "#d8dee9", bg = "none" })

    -- Inactive window statusline
    vim.api.nvim_set_hl(0, "MiniStatuslineInactive", { fg = "#100F14", bg = "none" })

    -- Other Mini modules
    require("mini.comment").setup()
    require("mini.indentscope").setup()
    require("mini.surround").setup()
    require("mini.pairs").setup()
    require("mini.ai").setup()
  end,
}
