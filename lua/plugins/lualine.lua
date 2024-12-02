-- return {
-- 	"nvim-lualine/lualine.nvim",
-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
-- 	config = function()
-- 		require("lualine").setup({
-- 			options = {
-- 				theme = 'auto',
-- 			},
-- 		})
-- 	end,
-- }

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = {
					normal = {
						a = { fg = '#100F14', bg = '#54C1DB', gui = 'bold' }, -- Normal mode
						b = { fg = '#ffffff', bg = '#100F14' },
						c = { fg = '#d8dee9', bg = 'none' }, -- Transparent center
					},
					insert = {
						a = { fg = '#100F14', bg = '#A9DD48', gui = 'bold' }, -- Insert mode
						b = { fg = '#ffffff', bg = '#100F14' },
						c = { fg = '#d8dee9', bg = 'none' }, -- Transparent center
					},
					visual = {
						a = { fg = '#100F14', bg = '#FD77DD', gui = 'bold' }, -- Visual mode
						b = { fg = '#ffffff', bg = '#100F14' },
						c = { fg = '#d8dee9', bg = 'none' }, -- Transparent center
					},
					replace = {
						a = { fg = '#ffffff', bg = '#ff3045', gui = 'bold' }, -- Replace mode
						b = { fg = '#ffffff', bg = '#100F14' },
						c = { fg = '#d8dee9', bg = 'none' }, -- Transparent center
					},
					command = {
						a = { fg = '#100F14', bg = '#f5dd58', gui = 'bold' }, -- Command mode
						b = { fg = '#ffffff', bg = '#100F14' },
						c = { fg = '#d8dee9', bg = 'none' }, -- Transparent center
					},
					inactive = {
						a = { fg = '#100F14', bg = '#2e3440', gui = 'bold' },
						b = { fg = '#100F14', bg = '#2e3440' },
						c = { fg = '#100F14', bg = 'none' }, -- Transparent center for inactive
					},
				},
				section_separators = { left = '', right = '' },
				component_separators = { left = '', right = '' },
			},
			sections = {
				lualine_a = { 'mode' },
				lualine_b = { 'branch', 'diff' },
				lualine_c = { { 'filename', path = 1 } },
				lualine_x = { 'encoding', 'fileformat', 'filetype' },
				lualine_y = { 'progress' },
				lualine_z = { 'location' },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { 'filename', path = 1 } },
				lualine_x = { 'location' },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = {},
		})
	end,
}
