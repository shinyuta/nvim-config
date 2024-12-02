return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				-- languages (https://github.com/williamboman/mason-lspconfig.nvim)
				ensure_installed = { "lua_ls", "ts_ls", "jdtls", "jsonls", "cssls", "html" },
				opts = {
					auto_install = true,
				},
			})

			local lspconfig = require("lspconfig")
			local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lsp_attach = function(client, bufnr)
				-- Create your keybindings here...
			end

			require("mason-lspconfig").setup_handlers({
				function(server_name)
					-- Don't call setup for JDTLS Java LSP because it will be setup from a separate config
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
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")

			-- languages setup
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})

			-- lspconfig.typos_lsp.setup({
			-- 	-- Logging level of the language server. Logs appear in :LspLog. Defaults to error.
			-- 	cmd_env = { RUST_LOG = "error" },
			-- 	init_options = {
			-- 		-- Custom config. Used together with a config file found in the workspace or its parents,
			-- 		-- taking precedence for settings declared in both.
			-- 		-- Equivalent to the typos `--config` cli argument.
			-- 		config = "~/code/typos-lsp/crates/typos-lsp/tests/typos.toml",
			-- 		-- How typos are rendered in the editor, can be one of an Error, Warning, Info or Hint.
			-- 		-- Defaults to error.
			-- 		diagnosticSeverity = "Error",
			-- 	},
			-- })

			-- Enable debug logs for the LSP client. Recommended for debugging only.

			lspconfig.eslint.setup({
				--- ...
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
