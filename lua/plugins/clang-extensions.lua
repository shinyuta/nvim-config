return {
	"p00f/clangd_extensions.nvim",
	dependencies = { "neovim/nvim-lspconfig" },
	config = function()
		require("clangd_extensions").setup({
			server = {
				capabilities = require("blink.cmp").get_lsp_capabilities(),
			},
		})
	end,
}
