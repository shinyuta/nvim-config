vim.keymap.set("n", "<leader>wq", ":wqa<CR>", { desc = "Save and quit" })
vim.keymap.set("n", "<leader>qq", ":q!<CR>", { desc = "Force quit" })
vim.keymap.set("n", "<leader>ww", ":w<CR>", { desc = "Save file" })
vim.keymap.set("n", "gx", ":!open <c-r><c-a><CR>", { desc = "Open URL" })

------------------ WINDOW MANAGEMENT ------------------

vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Vertical split" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Horizontal split" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equal size splits" })
vim.keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close split" })
vim.keymap.set("n", "<leader>sk", "<C-w>+", { desc = "Increase height" })
vim.keymap.set("n", "<leader>sl", "<C-w>>5", { desc = "Increase width" })
vim.keymap.set("n", "<leader>sw", "<C-w><5", { desc = "Decrease width" })

------------------ CLIPBOARD ------------------

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>Y", '"+Y', { desc = "Yank line to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", '"+d', { desc = "Delete to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>D", '"+D', { desc = "Delete line to clipboard" })
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Paste from clipboard" })
vim.keymap.set("n", "<leader>P", '"+P', { desc = "Paste above from clipboard" })

------------------ LSP ------------------

vim.keymap.set("n", "<leader>ci", vim.lsp.buf.hover, { desc = "Code info" })
vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "Code definition" })
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.references, { desc = "Code references" })
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
vim.keymap.set("n", "<leader>cn", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>cp", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set("n", "<leader>gf", function()
	local bufnr = vim.api.nvim_get_current_buf()
	local ft = vim.bo.filetype

	local prefer_none_ls = {
		"python",
		"javascript",
		"lua",
		"typescript",
		"markdown",
		"yaml",
		"ruby",
		"html",
		"css",
		"json",
		"go",
		"rust",
		"c",
		"cpp",
	}

	local none_ls_clients = vim.tbl_filter(function(client)
		return client.name == "null-ls"
	end, vim.lsp.get_active_clients({ bufnr = bufnr }))

	if vim.tbl_contains(prefer_none_ls, ft) and #none_ls_clients > 0 then
		vim.notify("⚡ Formatting " .. ft .. " using none-ls", "info", { title = "Formatter" })

		vim.lsp.buf.format({
			bufnr = bufnr,
			filter = function(client)
				return client.name == "null-ls"
			end,
		})
	else
		vim.notify("  Formatting " .. ft .. " using LSP", "info", { title = "Formatter" })

		vim.lsp.buf.format({ bufnr = bufnr })
	end
end, { desc = "Smart Format File" })

------------------ TELESCOPE ------------------

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>ld", ":Telescope diagnostics bufnr=0<CR>", { desc = "Show file diagnostics (Telescope)" })
vim.keymap.set("n", "<leader>fr", ":Telescope frecency<CR>", { desc = "Telescope Frequent Files" })
vim.keymap.set("n", "<leader>fs", function()
	require("telescope.builtin").find_files({
		cwd = "~/Desktop/notes/work/school",
		find_command = { "fd", "--type", "f", "--ignore-file", ".ignore" },
	})
end, { desc = "Telescope Find School Files" })
vim.keymap.set("n", "<leader>fp", function()
	require("telescope").load_extension("project") -- Forces it to always reload
	require("telescope").extensions.project.project()
end, { desc = "Telescope Project Switcher" })

------------------ desc ------------------

local spectre = require("spectre")

vim.keymap.set("n", "<leader>sf", function()
	spectre.open_file_search({ select_word = true })
end, { desc = "Search & Replace in Current File" })

vim.keymap.set("n", "<leader>sb", function()
	spectre.open({ is_insert_mode = false, search_text = "", is_file = false })
end, { desc = "Search & Replace in Open Buffers" })

vim.api.nvim_create_user_command("CleanSpectreJunk", function()
	vim.fn.jobstart({
		"find",
		".",
		"-type",
		"f",
		"-name",
		"*-E*",
		"-delete",
	}, {
		stdout_buffered = true,
		on_exit = function(_, code)
			if code == 0 then
				vim.notify("Spectre junk files cleaned successfully!", vim.log.levels.INFO, { title = "Cleanup" })
			else
				vim.notify("Failed to clean Spectre junk files.", vim.log.levels.ERROR, { title = "Cleanup" })
			end
		end,
	})
end, { desc = "Remove Spectre backup files (-E files) from current directory" })

------------------ HARPOON ------------------

local harpoon = require("harpoon")
harpoon:setup()
vim.keymap.set("n", "<leader>ha", function()
	harpoon:list():add()
end, { desc = "Harpoon add file" })

vim.keymap.set("n", "<leader>hh", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon menu" })

vim.keymap.set("n", "<leader>h1", function()
	harpoon:list():select(1)
end, { desc = "Harpoon file 1" })

vim.keymap.set("n", "<leader>h2", function()
	harpoon:list():select(2)
end, { desc = "Harpoon file 2" })

vim.keymap.set("n", "<leader>h3", function()
	harpoon:list():select(3)
end, { desc = "Harpoon file 3" })

vim.keymap.set("n", "<leader>h4", function()
	harpoon:list():select(4)
end, { desc = "Harpoon file 4" })

------------------ DEBUGGING ------------------

vim.keymap.set("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", { desc = "Toggle breakpoint" })
vim.keymap.set(
	"n",
	"<leader>bc",
	"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
	{ desc = "Conditional breakpoint" }
)
vim.keymap.set(
	"n",
	"<leader>bl",
	"<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
	{ desc = "Logpoint" }
)
vim.keymap.set("n", "<leader>br", "<cmd>lua require'dap'.clear_breakpoints()<cr>", { desc = "Clear breakpoints" })
vim.keymap.set("n", "<leader>ba", "<cmd>Telescope dap list_breakpoints<cr>", { desc = "List breakpoints" })
vim.keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", { desc = "Continue" })
vim.keymap.set("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>", { desc = "Step over" })
vim.keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>", { desc = "Step into" })
vim.keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>", { desc = "Step out" })
vim.keymap.set("n", "<leader>dd", function()
	require("dap").disconnect()
	require("dapui").close()
end, { desc = "Disconnect debug" })
vim.keymap.set("n", "<leader>dt", function()
	require("dap").terminate()
	require("dapui").close()
end, { desc = "Terminate debug" })
vim.keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", { desc = "Toggle REPL" })
vim.keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", { desc = "Run last" })
vim.keymap.set("n", "<leader>di", function()
	require("dap.ui.widgets").hover()
end, { desc = "Inspect value" })
vim.keymap.set("n", "<leader>d?", function()
	require("dap.ui.widgets").centered_float(require("dap.ui.widgets").scopes)
end, { desc = "Show scopes" })
vim.keymap.set("n", "<leader>df", "<cmd>Telescope dap frames<cr>", { desc = "Telescope frames" })
vim.keymap.set("n", "<leader>dh", "<cmd>Telescope dap commands<cr>", { desc = "Telescope commands" })
vim.keymap.set("n", "<leader>e", function()
	vim.diagnostic.open_float(nil, { focusable = false })
end, { desc = "Show diagnostics in floating window" })

------------------ BUFFERLINE ------------------

vim.keymap.set("n", "<leader>q", ":Bdelete<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader>bn", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bm", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>BufferLineTogglePin<cr>", { desc = "Pin buffer" })
vim.keymap.set("n", "<leader>bx", function()
	Snacks.bufdelete.other(opts)
end, { desc = "Delete other buffers" })
vim.keymap.set("n", "<leader>bd", function()
	Snacks.bufdelete()
end, { desc = "Delete buffer" })

------------------ TESTING ------------------

vim.keymap.set("n", "<leader>tc", function()
	if vim.bo.filetype == "java" then
		require("jdtls").desc_class()
	end
end, { desc = "desc class (Java)" })

vim.keymap.set("n", "<leader>tm", function()
	if vim.bo.filetype == "java" then
		require("jdtls").desc_nearest_method()
	end
end, { desc = "desc method (Java)" })

------------------ SUBSTITUTE ------------------

vim.keymap.set("n", "s", require("substitute").operator, { desc = "Substitute operator" })
vim.keymap.set("n", "ss", require("substitute").line, { desc = "Substitute line" })
vim.keymap.set("n", "S", require("substitute").eol, { desc = "Substitute to end of line" })
vim.keymap.set("x", "s", require("substitute").visual, { desc = "Substitute visual" })

------------------ SNACKS ------------------

vim.keymap.set("n", "<leader>dn", function()
	Snacks.notifier.hide()
end, { desc = "Hide Snacks notifications" })

vim.keymap.set("n", "<leader>rF", function()
	Snacks.rename.rename_file()
end, { desc = "Rename current file" })

vim.keymap.set("n", "<leader>tt", function()
	Snacks.terminal()
end, { desc = "Open Snacks terminal" })

vim.keymap.set("n", "<leader>zz", function()
	Snacks.zen()
end, { desc = "Toggle Snacks Zen mode" })

------------------ SNACKS LAZYGIT  ------------------

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

------------------ DASHBOARD (Hidden Keybinds) ------------------

vim.api.nvim_create_autocmd("FileType", {
	pattern = "snacks_dashboard",
	callback = function()
		vim.defer_fn(function()
			vim.keymap.set("n", "l", ":Lazy<CR>", { buffer = true, silent = true })
			vim.keymap.set("n", "k", ":edit ~/.config/nvim/lua/core/keybinds.lua<CR>", { buffer = true, silent = true })
		end, 100) -- Small delay to ensure Snacks doesn't overwrite
	end,
})

------------------ MISC ------------------

vim.keymap.set("n", "<C-e>", ":Telescope noice<CR>", { desc = "Telescope Noice" })
vim.keymap.set("n", "<leader>td", "<cmd>Dooing<cr>", { desc = "Open Dooing" })
