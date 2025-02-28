------------------ GENERAL ------------------

vim.keymap.set("n", "<leader>wq", ":wq<CR>")
vim.keymap.set("n", "<leader>wqq", ":wqa<CR>")
vim.keymap.set("n", "<leader>qq", ":q!<CR>")
vim.keymap.set("n", "<leader>ww", ":w<CR>")
vim.keymap.set("n", "gx", ":!open <c-r><c-a><CR>")

------------------ WINDOW MANAGEMENT ------------------

vim.keymap.set("n", "<leader>sv", "<C-w>v")
vim.keymap.set("n", "<leader>sh", "<C-w>s")
vim.keymap.set("n", "<leader>se", "<C-w>=")
vim.keymap.set("n", "<leader>sx", ":close<CR>")
vim.keymap.set("n", "<leader>sk", "<C-w>+")
vim.keymap.set("n", "<leader>sl", "<C-w>>5")
vim.keymap.set("n", "<leader>sh", "<C-w><5")

------------------ CLIPBOARD ------------------

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set({ "n", "v" }, "<leader>Y", '"+Y')
vim.keymap.set({ "n", "v" }, "<leader>d", '"+d')
vim.keymap.set({ "n", "v" }, "<leader>D", '"+D')
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>P", '"+P')

------------------ LINE MOVEMENT ------------------

vim.keymap.set("n", "<Esc-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<Esc-k>", ":m .-2<CR>==")
vim.keymap.set("v", "<Esc-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<Esc-k>", ":m '<-2<CR>gv=gv")

------------------ PANE NAVIGATION ------------------

vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

------------------ LSP ------------------

vim.keymap.set("n", "<leader>ci", vim.lsp.buf.hover, { desc = "Code info" })
vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "Code definition" })
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.references, { desc = "Code references" })
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
vim.keymap.set("n", "<leader>gf", function()
	vim.lsp.buf.format({ async = true })
end, { desc = "Format code" })
vim.keymap.set("n", "<leader>cn", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>cp", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })

------------------ TELESCOPE ------------------

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

------------------ HARPOON ------------------

local harpoon = require("harpoon")
harpoon:setup()
vim.keymap.set("n", "<leader>ha", function()
	harpoon:list():add()
end)
vim.keymap.set("n", "<leader>hh", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)
vim.keymap.set("n", "<leader>h1", function()
	harpoon:list():select(1)
end)
vim.keymap.set("n", "<leader>h2", function()
	harpoon:list():select(2)
end)
vim.keymap.set("n", "<leader>h3", function()
	harpoon:list():select(3)
end)
vim.keymap.set("n", "<leader>h4", function()
	harpoon:list():select(4)
end)

------------------ DEBUGGING ------------------

vim.keymap.set("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
vim.keymap.set("n", "<leader>bc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")
vim.keymap.set(
	"n",
	"<leader>bl",
	"<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>"
)
vim.keymap.set("n", "<leader>br", "<cmd>lua require'dap'.clear_breakpoints()<cr>")
vim.keymap.set("n", "<leader>ba", "<cmd>Telescope dap list_breakpoints<cr>")
vim.keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>")
vim.keymap.set("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>")
vim.keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>")
vim.keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>")
vim.keymap.set("n", "<leader>dd", function()
	require("dap").disconnect()
	require("dapui").close()
end)
vim.keymap.set("n", "<leader>dt", function()
	require("dap").terminate()
	require("dapui").close()
end)
vim.keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>")
vim.keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>")
vim.keymap.set("n", "<leader>di", function()
	require("dap.ui.widgets").hover()
end)
vim.keymap.set("n", "<leader>d?", function()
	require("dap.ui.widgets").centered_float(require("dap.ui.widgets").scopes)
end)
vim.keymap.set("n", "<leader>df", "<cmd>Telescope dap frames<cr>")
vim.keymap.set("n", "<leader>dh", "<cmd>Telescope dap commands<cr>")
vim.keymap.set("n", "<leader>de", function()
	require("telescope.builtin").diagnostics({ default_text = ":E:" })
end)

------------------ BUFFERLINE ------------------

vim.keymap.set("n", "<leader>q", ":Bdelete<CR>")
vim.keymap.set("n", "<leader>bn", "<cmd>BufferLineCycleNext<cr>")
vim.keymap.set("n", "<leader>bm", "<cmd>BufferLineCyclePrev<cr>")
vim.keymap.set("n", "<leader>bp", "<cmd>BufferLineTogglePin<cr>")
vim.keymap.set("n", "<leader>bx", function()
	Snacks.bufdelete.other(opts)
end)
vim.keymap.set("n", "<leader>bd", function()
	Snacks.bufdelete()
end)

------------------ TESTING ------------------

vim.keymap.set("n", "<leader>tc", function()
	if vim.bo.filetype == "java" then
		require("jdtls").test_class()
	end
end)
vim.keymap.set("n", "<leader>tm", function()
	if vim.bo.filetype == "java" then
		require("jdtls").test_nearest_method()
	end
end)

------------------ SUBSTITUTE ------------------

vim.keymap.set("n", "s", require("substitute").operator)
vim.keymap.set("n", "ss", require("substitute").line)
vim.keymap.set("n", "S", require("substitute").eol)
vim.keymap.set("x", "s", require("substitute").visual)

------------------ MISC ------------------

vim.keymap.set("n", "<C-e>", ":Telescope noice<CR>")
vim.keymap.set("n", "<leader>td", "<cmd>Dooing<cr>")
vim.keymap.set("n", "<leader>m", require("treesj").toggle)
vim.keymap.set("n", "<leader>M", function()
	require("treesj").toggle({ split = { recursive = true } })
end)

------------------ SNACKS ------------------

vim.keymap.set("n", "<leader>dn", function()
	Snacks.notifier.hide()
end)

vim.keymap.set("n", "<leader>rF", function()
	Snacks.rename.rename_file()
end)

vim.keymap.set("n", "<leader>tt", function()
	Snacks.terminal()
end)

vim.keymap.set("n", "<leader>zz", function()
	Snacks.zen()
end)

------------------ SNACKS LAZYGIT  ------------------

vim.keymap.set("n", "<leader>lg", function()
	Snacks.lazygit()
end, { desc = "Lazygit" })

vim.keymap.set("n", "<leader>gb", function()
	Snacks.git.blame_line()
end, { desc = "Git Blame Line" })

vim.keymap.set("n", "<leader>gB", function()
	Snacks.gitbrowse()
end, { desc = "Git Browse" })

vim.keymap.set("n", "<leader>lGH", function()
	Snacks.lazygit.log_file()
end, { desc = "Lazygit Current File History" })

vim.keymap.set("n", "<leader>lGL", function()
	Snacks.lazygit.log()
end, { desc = "Lazygit Log (cwd)" })
