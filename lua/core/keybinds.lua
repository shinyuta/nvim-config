------------------ GENERAL ------------------

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
vim.keymap.set("n", "<leader>gf", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Format code" })
vim.keymap.set("n", "<leader>cn", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>cp", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })

------------------ TELESCOPE ------------------

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })

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
vim.keymap.set("n", "<leader>de", function()
  require("telescope.builtin").diagnostics({ default_text = ":E:" })
end, { desc = "Filter diagnostics" })

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
    require("jdtls").test_class()
  end
end, { desc = "Test class (Java)" })

vim.keymap.set("n", "<leader>tm", function()
  if vim.bo.filetype == "java" then
    require("jdtls").test_nearest_method()
  end
end, { desc = "Test method (Java)" })

------------------ SUBSTITUTE ------------------

vim.keymap.set("n", "s", require("substitute").operator, { desc = "Substitute operator" })
vim.keymap.set("n", "ss", require("substitute").line, { desc = "Substitute line" })
vim.keymap.set("n", "S", require("substitute").eol, { desc = "Substitute to end of line" })
vim.keymap.set("x", "s", require("substitute").visual, { desc = "Substitute visual" })

------------------ MISC ------------------

vim.keymap.set("n", "<C-e>", ":Telescope noice<CR>", { desc = "Telescope Noice" })
vim.keymap.set("n", "<leader>td", "<cmd>Dooing<cr>", { desc = "Open Dooing" })
vim.keymap.set("n", "<leader>m", require("treesj").toggle, { desc = "Toggle Treesj" })
vim.keymap.set("n", "<leader>j", function()
  require("treesj").join()
end, { desc = "Treesj Join" })
vim.keymap.set("n", "<leader>M", function()
  require("treesj").toggle({ split = { recursive = true } })
end, { desc = "Toggle Treesj recursive" })

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
