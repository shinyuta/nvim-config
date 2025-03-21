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
		cmd = "MasonToolsUpdate", -- Only loads if you explicitly run :MasonToolsUpdate
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"stylua", -- Lua
					"black",
					"isort", -- Python
					"prettier", -- JS/TS/Markdown/HTML/CSS/YAML/JSON
					"rubocop", -- Ruby
					"gofumpt", -- Go
					"clang-format", -- C/C++
          "cssls" -- css
				},
				auto_update = false,
			})
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		event = { "BufReadPre", "BufNewFile" }, -- Only loads if you open a file
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"pyright",
					"ts_ls",
					"marksman",
					"html",
					"cssls",
					"jsonls",
					"yamlls",
					"solargraph",
					"gopls",
					"rust_analyzer",
					"jdtls",
					"clangd",
					"eslint",
				},
			})
		end,
	},
}
