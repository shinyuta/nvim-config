return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {

        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.isort, -- python
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.rubocop,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.codespell, -- text file spellings.

        null_ls.builtins.diagnostics.yamllint,
        null_ls.builtins.diagnostics.rubocop,
        require("none-ls.diagnostics.eslint_d"),

        null_ls.builtins.code_actions.gitsigns,
      },
    })

  end,
}
