return {
	"p00f/clangd_extensions.nvim",
	dependencies = { "neovim/nvim-lspconfig" },
	config = function()
		require("clangd_extensions").setup({
			server = {
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			},
		})
	end,
}
