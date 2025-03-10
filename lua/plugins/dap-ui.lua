return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
	},
	event = "VeryLazy", -- Load only when needed
	config = function()
		local dap, dapui = require("dap"), require("dapui")

-- Function to toggle between global and per-window statusline
local function update_statusline()
	local current_status = vim.opt.laststatus:get()

	if dap.session() and current_status ~= 2 then
		vim.opt.laststatus = 2 -- Switch to per-window statusline when debugging
	elseif not dap.session() and current_status ~= 3 then
		vim.opt.laststatus = 3 -- Switch back to global statusline when debugging ends
	end
end

		-- DAP UI Setup
		dapui.setup({
			layouts = {
				{
					elements = {
						{ id = "scopes", size = 0.3 },
						{ id = "stacks", size = 0.3 },
						{ id = "watches", size = 0.2 },
						{ id = "breakpoints", size = 0.2 },
					},
					size = 40,
					position = "left",
				},
				{
					elements = {
						{ id = "repl", size = 0.5 },
						{ id = "console", size = 0.5 },
					},
					size = 10,
					position = "bottom",
				},
			},
			floating = {
				max_height = 0.8,
				max_width = 0.8,
				border = "rounded",
				mappings = {
					close = { "q", "<Esc>" },
				},
			},
			render = {
				max_type_length = nil,
			},
		})

		-- Auto open UI & switch to per-window statusline when debugging starts
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
			update_statusline()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
			update_statusline()
		end

		-- Auto revert to global statusline when debugging ends
		dap.listeners.before.event_terminated.dapui_config = function()
			update_statusline()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			update_statusline()
			dapui.close()
		end

		-- Ensure correct statusline on startup
		vim.api.nvim_create_autocmd("VimEnter", {
			callback = update_statusline,
		})
	end,
}
