------------------ SNACKS CORE ------------------

vim.keymap.set("n", "<leader>dn", function()
	Snacks.notifier.hide()
end, { desc = "Hide Snacks notifications" })

vim.keymap.set("n", "<leader>rF", function()
	Snacks.rename.rename_file()
end, { desc = "Rename current file" })

vim.keymap.set("n", "<leader>zz", function()
	Snacks.zen()
end, { desc = "Toggle Snacks Zen mode" })

------------------ SNACKS LAZYGIT ------------------

vim.keymap.set("n", "<leader>lg", function()
	Snacks.lazygit()
end, { desc = "Open Lazygit" })

vim.keymap.set("n", "<leader>gb", function()
	Snacks.git.blame_line()
end, { desc = "Git blame current line" })

vim.keymap.set("n", "<leader>gB", function()
	Snacks.gitbrowse()
end, { desc = "Browse repo in browser" })

vim.keymap.set("n", "<leader>lGH", function()
	Snacks.lazygit.log_file()
end, { desc = "Lazygit file history" })

vim.keymap.set("n", "<leader>lGL", function()
	Snacks.lazygit.log()
end, { desc = "Lazygit repository log" })

------------------ SNACKS SCOPE ------------------

vim.keymap.set("n", "<leader>si", function()
	require("snacks.scope").textobject({
		min_size = 2,
		edge = false,
		only_current = true,
		siblings = false,
		linewise = true,
	})
end, { desc = "Select inner current scope" })

vim.keymap.set("n", "<leader>sa", function()
	require("snacks.scope").textobject({
		min_size = 2,
		edge = true,
		cursor = false,
		only_current = true,
		siblings = false,
		linewise = true,
	})
end, { desc = "Select around current scope" })

-- Jump keybinds for moving to scope edges
vim.keymap.set("n", "<leader>st", function()
	require("snacks.scope").jump({ min_size = 1, bottom = false })
end, { desc = "Jump to top edge of scope" })

vim.keymap.set("n", "<leader>sb", function()
	require("snacks.scope").jump({ min_size = 1, bottom = true })
end, { desc = "Jump to bottom edge of scope" })

vim.keymap.set("n", "<leader>sn", function()
	local ts_utils = require("nvim-treesitter.ts_utils")
	local node = ts_utils.get_node_at_cursor()
	if not node then
		vim.notify("No node at cursor")
		return
	end
	-- Ascend until we are inside a function definition/declaration
	while node and not (node:type() == "function_definition" or node:type() == "function_declaration") do
		node = node:parent()
	end
	if not node then
		vim.notify("Not inside a function")
		return
	end
	local current_func = node
	local parent = current_func:parent()
	if not parent then
		vim.notify("No parent found")
		return
	end

	local found_current = false
	local next_func = nil
	for child in parent:iter_children() do
		if child == current_func then
			found_current = true
		elseif found_current and (child:type() == "function_definition" or child:type() == "function_declaration") then
			next_func = child
			break
		end
	end

	if next_func then
		local start_row, _, _, _ = next_func:range()
		vim.api.nvim_win_set_cursor(0, { start_row + 1, 0 })
	else
		vim.notify("No next same-level function found")
	end
end, { desc = "Jump to next same-level function" })

vim.keymap.set("n", "<leader>sp", function()
	local ts_utils = require("nvim-treesitter.ts_utils")
	local node = ts_utils.get_node_at_cursor()
	if not node then
		vim.notify("No node at cursor")
		return
	end
	-- Ascend until we are inside a function definition/declaration
	while node and not (node:type() == "function_definition" or node:type() == "function_declaration") do
		node = node:parent()
	end
	if not node then
		vim.notify("Not inside a function")
		return
	end
	local current_func = node
	local parent = current_func:parent()
	if not parent then
		vim.notify("No parent found")
		return
	end

	local prev_func = nil
	for child in parent:iter_children() do
		if child == current_func then
			break
		elseif child:type() == "function_definition" or child:type() == "function_declaration" then
			prev_func = child
		end
	end

	if prev_func then
		local start_row, _, _, _ = prev_func:range()
		vim.api.nvim_win_set_cursor(0, { start_row + 1, 0 })
	else
		vim.notify("No previous same-level function found")
	end
end, { desc = "Jump to previous same-level function" })
