------------------ SNACKS IMPORT -----------------

require("core.snacks-keybinds")

------------------ FILE OPERATIONS ------------------

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
local telescope_loader = require("core.telescope-loader")

vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fs", function()
	builtin.find_files({
		cwd = "~/Desktop/notes/work/school",
		find_command = { "fd", "--type", "f", "--ignore-file", ".ignore" },
	})
end, { desc = "Telescope Find School Files" })

vim.keymap.set("n", "<leader>fz", function()
	telescope_loader.load_common_extensions()
	require("telescope").extensions.zoxide.list()
end, { desc = "Zoxide search" })

vim.keymap.set("n", "<leader>fp", function()
	telescope_loader.load_common_extensions()
	require("telescope").extensions.project.project()
end, { desc = "Telescope Project Switcher" })

vim.keymap.set("n", "<C-e>", function()
	telescope_loader.load_common_extensions()
	require("telescope").extensions.noice.noice()
end, { desc = "Telescope Noice" })

vim.keymap.set("n", "<leader>fy", function()
	telescope_loader.load_common_extensions()
	require("telescope").extensions.yank_history.yank_history()
end, { desc = "Yank history (Telescope)" })

------------------ SPECTRE ------------------

local spectre = require("spectre")

vim.keymap.set("n", "<leader>sf", function()
	spectre.open_file_search({ select_word = true })
end, { desc = "Search & Replace in Current File" })

vim.keymap.set("n", "<leader>sb", function()
	spectre.open({ is_insert_mode = false, search_text = "", is_file = false })
end, { desc = "Search & Replace in Open Buffers" })

vim.api.nvim_create_user_command("CleanSpectreJunk", function()
	vim.fn.jobstart({ "find", ".", "-type", "f", "-name", "*-E*", "-delete" }, {
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

------------------ TROUBLE ------------------

local trouble = require("trouble")

vim.keymap.set("n", "<leader>xx", function()
	trouble.toggle("diagnostics")
end, { desc = "Diagnostics (Trouble)" })
vim.keymap.set("n", "<leader>xX", function()
	trouble.toggle("diagnostics", { filter = { buf = 0 } })
end, { desc = "Buffer Diagnostics (Trouble)" })

vim.keymap.set("n", "<leader>cs", function()
	trouble.toggle("symbols", { focus = false })
end, { desc = "Symbols (Trouble)" })
vim.keymap.set("n", "<leader>cl", function()
	trouble.toggle("lsp", { focus = false, win = { position = "right" } })
end, { desc = "LSP Definitions/References (Trouble)" })
vim.keymap.set("n", "<leader>xL", function()
	trouble.toggle("loclist")
end, { desc = "Location List (Trouble)" })
vim.keymap.set("n", "<leader>xQ", function()
	trouble.toggle("qflist")
end, { desc = "Quickfix List (Trouble)" })

------------------ HARPOON ------------------

local harpoon = require("harpoon")
harpoon:setup()

local uv = vim.loop

vim.keymap.set("n", "<leader>ha", function()
	local harpoon_list = harpoon:list()
	local current_file = uv.fs_realpath(vim.fn.expand("%:p"))

	local is_already_added = false
	for _, item in ipairs(harpoon_list.items) do
		if uv.fs_realpath(item.value) == current_file then
			is_already_added = true
			break
		end
	end

	if is_already_added then
		harpoon.ui:toggle_quick_menu(harpoon_list)
	else
		harpoon_list:add()
		vim.notify("Added file to Harpoon!", vim.log.levels.INFO, { title = "Harpoon" })
	end
end, { desc = "Harpoon Add or Open Menu" })

vim.keymap.set("n", "<leader>hd", function()
	local harpoon_list = harpoon:list()
	local current_file = uv.fs_realpath(vim.fn.expand("%:p"))

	local index = nil
	for i, item in ipairs(harpoon_list.items) do
		if uv.fs_realpath(item.value) == current_file then
			index = i
			break
		end
	end

	if index then
		harpoon_list:remove_at(index)
		vim.notify("Removed file from Harpoon!", vim.log.levels.WARN, { title = "Harpoon" })
	else
		vim.notify("File is not in Harpoon list", vim.log.levels.INFO, { title = "Harpoon" })
	end
end, { desc = "Harpoon Remove Current File" })

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

------------------ DEBUGGING (DAP) ------------------

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
	Snacks.bufdelete.other()
end, { desc = "Delete other buffers" })
vim.keymap.set("n", "<leader>bd", function()
	Snacks.bufdelete()
end, { desc = "Delete buffer" })

------------------ TESTING ------------------

vim.keymap.set("n", "<leader>tc", function()
	if vim.bo.filetype == "java" then
		require("jdtls").test_class()
	end
end, { desc = "Test class (Java)" })

vim.keymap.set("n", "<leader>tm", function()
	if vim.bo.filetype == "java" then
		require("jdtls").test_nearest_method()
	end
end, { desc = "Test method (Java)" })

------------------ TOGGLETERM ------------------

local Terminal = require("toggleterm.terminal").Terminal

local float_term = Terminal:new({ direction = "float" })
local horizontal_term = Terminal:new({ direction = "horizontal", size = 12 })
local vertical_term = Terminal:new({ direction = "vertical", size = 50 })

vim.keymap.set("n", "<leader>tt", function()
	float_term:toggle()
end, { desc = "Floating terminal" })

vim.keymap.set("n", "<leader>th", function()
	horizontal_term:toggle()
end, { desc = "Horizontal terminal" })

vim.keymap.set("n", "<leader>tv", function()
	vertical_term:toggle()
end, { desc = "Vertical terminal" })

vim.keymap.set("t", "<C-t>", "<C-\\><C-n>", { desc = "Escape terminal mode" })

------------------ SUBSTITUTE ------------------

vim.keymap.set("n", "s", require("substitute").operator, { desc = "Substitute operator" })
vim.keymap.set("n", "ss", require("substitute").line, { desc = "Substitute line" })
vim.keymap.set("n", "S", require("substitute").eol, { desc = "Substitute to end of line" })
vim.keymap.set("x", "s", require("substitute").visual, { desc = "Substitute visual" })

------------------ MISC ------------------

vim.keymap.set("n", "<leader>td", "<cmd>Dooing<cr>", { desc = "Open Dooing" })
