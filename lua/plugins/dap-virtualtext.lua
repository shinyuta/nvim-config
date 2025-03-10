return {
	"theHamsta/nvim-dap-virtual-text",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-treesitter/nvim-treesitter",
	},
	event = "BufReadPre", -- Load on file open
	config = function()
		require("nvim-dap-virtual-text").setup({
			enabled = true, -- Enable virtual text
			enabled_commands = true, -- Commands: DapVirtualTextEnable, DapVirtualTextDisable, etc.
			highlight_changed_variables = true, -- Highlight changed variables
			highlight_new_as_changed = false, -- Highlight new variables like changed ones
			show_stop_reason = true, -- Show stop reason on exception
			commented = false, -- Prefix with comment syntax
			only_first_definition = true, -- Show only at first definition
			all_references = false, -- Show at all references (not just definitions)
			clear_on_continue = false, -- Clear on "continue" to prevent flickering
			display_callback = function(variable, buf, stackframe, node, options)
				-- Format virtual text display
				if options.virt_text_pos == "inline" then
					return " = " .. variable.value:gsub("%s+", " ")
				else
					return variable.name .. " = " .. variable.value:gsub("%s+", " ")
				end
			end,
			virt_text_pos = vim.fn.has("nvim-0.10") == 1 and "inline" or "eol",
			all_frames = false, -- Show for all stack frames (experimental)
			virt_lines = false, -- Show virtual lines instead of text (flickers)
			virt_text_win_col = nil, -- Set column for virtual text (e.g., 80)
		})
	end,
}
