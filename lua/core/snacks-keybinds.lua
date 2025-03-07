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
