return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-telescope/telescope-dap.nvim",
	},
	config = function()
		local dap = require("dap")

		-- Adapter setup for codelldb
		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = vim.fn.expand("~/.local/share/nvim/mason/bin/codelldb"),
				args = { "--port", "${port}" },
			},
		}

		-- Cache for the executable path
		local last_executable = nil

		dap.configurations.c = {
			{
				name = "Launch",
				type = "codelldb",
				request = "launch",
				program = function()
					if last_executable then
						return last_executable
					end
					last_executable = vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					return last_executable
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},
				runInTerminal = false,
			},
		}

		-- Alias C++ config to the same setup
		dap.configurations.cpp = dap.configurations.c

		-- Reset executable when debugging is restarted with <leader>dc
		vim.keymap.set("n", "<leader>dc", function()
			last_executable = nil -- Clear cached executable path
			dap.continue()
		end, { desc = "Restart Debugging (Clear Executable Cache)" })

		-- DAP UI
		local dapui = require("dapui")
		dapui.setup()

		-- Auto open/close UI when debugging starts/stops
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			-- dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			-- dapui.close()
		end
	end,
}
