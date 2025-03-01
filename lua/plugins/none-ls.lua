return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvimtools/none-ls-extras.nvim" },
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- Lua
				null_ls.builtins.formatting.stylua,

				-- Python
				null_ls.builtins.formatting.isort,
				null_ls.builtins.formatting.black,

				-- JS/TS/HTML/CSS/Markdown/JSON/YAML
				null_ls.builtins.formatting.prettier.with({
					filetypes = {
						"javascript",
						"typescript",
						"html",
						"css",
						"json",
						"yaml",
						"markdown",
					},
				}),

				-- Ruby
				null_ls.builtins.formatting.rubocop,

				-- Go
				null_ls.builtins.formatting.gofumpt,

				-- C/C++
				null_ls.builtins.formatting.clang_format,

				-- Spellcheck and misc
				null_ls.builtins.formatting.codespell,
				null_ls.builtins.code_actions.gitsigns,
			},
		})
	end,
}
