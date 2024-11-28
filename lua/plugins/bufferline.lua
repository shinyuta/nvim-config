return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	init = function()
		vim.opt.termguicolors = true
	end,
	config = function()
		require("bufferline").setup({
			options = {
        mode = "buffers",
        style_preset = require('bufferline').style_preset.minimal,
        themeable = true,
        diagnostics = "nvim-lsp",
        diagnostics_update_in_insert = true,
        color_icons = true,
        separator_style = "thin",
        show_buffer_close_icons = true,
        hover = {
          enabled = true,
          delay = 200,
          reveal = {'close'}
        },
				offsets = {
					{
						filetype = "neo-tree",
						text = "Directory",
						text_align = "center",
						separator = true,
					},
				},
			},
		})
	end,
}
