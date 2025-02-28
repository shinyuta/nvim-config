return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason", -- Only load if you explicitly run :Mason
    config = function()
      require("mason").setup()
    end,
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = true, -- Only loads if some plugin explicitly calls it
    dependencies = { "williamboman/mason.nvim" },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" }, -- Loads only if editing a file
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls", -- Correct name for TypeScript
          "jdtls",
          "jsonls",
          "cssls",
          "html",
        },
        auto_install = true,
      })

      local lspconfig = require("lspconfig")
      local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lsp_attach = function(client, bufnr)
        -- Add your custom on_attach logic here if needed
      end

      require("mason-lspconfig").setup_handlers({
        function(server_name)
          if server_name ~= "jdtls" then
            lspconfig[server_name].setup({
              on_attach = lsp_attach,
              capabilities = lsp_capabilities,
            })
          end
        end,
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" }, -- Also lazy-loaded
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })

      lspconfig.ts_ls.setup({ -- Correct name for TypeScript
        capabilities = capabilities,
      })

      lspconfig.eslint.setup({
        on_attach = function(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
      })
    end,
  },
}
