return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvimtools/none-ls-extras.nvim" },
  event = { "BufReadPre", "BufNewFile" },
  ft = { "lua", "python", "javascript", "yaml", "ruby", "markdown" },
  config = function()
    local null_ls = require("null-ls")

    local sources_by_ft = {
      lua = {
        null_ls.builtins.formatting.stylua,
      },
      python = {
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.black,
      },
      javascript = {
        null_ls.builtins.formatting.prettier,
        require("none-ls.diagnostics.eslint_d"),
      },
      yaml = {
        null_ls.builtins.diagnostics.yamllint,
      },
      ruby = {
        null_ls.builtins.formatting.rubocop,
        null_ls.builtins.diagnostics.rubocop,
      },
      markdown = {
        null_ls.builtins.formatting.codespell,
      },
      git = {
        null_ls.builtins.code_actions.gitsigns,
      },
    }

    local ft = vim.bo.filetype
    local sources = {}

    for _, source in ipairs(sources_by_ft[ft] or {}) do
      table.insert(sources, source)
    end

    null_ls.setup({
      sources = sources,
    })
  end,
}
