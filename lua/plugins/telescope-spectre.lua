return {
	"nvim-pack/nvim-spectre",
	cmd = "Spectre",
	config = function()
		local spectre = require("spectre")
		local actions = require("spectre.actions")

		-- Patch Spectre's default replace to auto-close after running
		local function run_and_close()
			actions.run_replace()
			vim.notify("Replacement executed. Closing Spectre.", vim.log.levels.INFO, { title = "Spectre" })
			vim.cmd("q") -- Auto-close the split after replacement
		end

		spectre.setup({
			open_cmd = "vnew",
			highlight = {
				search = "Search",
				replace = "DiffAdd",
			},
			mapping = {
				["toggle_line"] = {
					map = "dd",
					cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
					desc = "Toggle item (add/remove from replace)",
				},
				["replace_cmd"] = {
					map = "<leader>R", -- Default Spectre keybind
					cmd = [[<cmd>lua require("spectre").run_and_close()<CR>]],
					desc = "Replace and Close Spectre",
				},
			},
		})

		spectre.run_and_close = run_and_close
	end,
}
