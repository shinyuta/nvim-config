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

------------------ DASHBOARD (HIDDEN KEYBINDS) ------------------

vim.api.nvim_create_autocmd("FileType", {
	pattern = "snacks_dashboard",
	callback = function()
		vim.defer_fn(function()
			vim.keymap.set("n", "l", ":Lazy<CR>", { buffer = true, silent = true })
			vim.keymap.set("n", "k", ":edit ~/.config/nvim/lua/core/keybinds.lua<CR>", { buffer = true, silent = true })
		end, 100)
	end,
})
