return {
	{
		"williamboman/mason.nvim",
		event = "BufReadPre",
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
					-- Formatters & Linters
					"stylua", -- Lua formatter
					"black", -- Python formatter
					"isort", -- Python import sorter
					"prettier", -- Formatter for JS/TS/Markdown/HTML/CSS/YAML/JSON
					"prettierd", -- Alternative Prettier formatter (if available)
					"rubocop", -- Ruby linter/formatter
					"gofumpt", -- Go formatter
					"clang-format", -- C/C++ formatter

					-- Language Servers
					"lua-language-server", -- Lua LSP
					"pyright", -- Python LSP
					"typescript-language-server", -- TS/JS LSP (for React, etc.)
					"json-lsp", -- JSON LSP
					"marksman", -- Markdown LSP
					"tailwindcss-language-server", -- Tailwind CSS LSP
					"css-lsp", -- CSS LSP
					"html-lsp", -- HTML LSP
					"emmet-ls", -- Emmet LSP for enhanced emmet completions in React JS files
					"ruby-lsp", -- Ruby LSP
					"gopls", -- Go LSP
					"rust-analyzer", -- Rust LSP
					"jdtls", -- Java LSP
					"clangd", -- C/C++ LSP
					"eslint-lsp", -- ESLint LSP
				},
				auto_update = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = true, -- or any minimal loading strategy, since you won't use it for LSP configuration
	},
}
