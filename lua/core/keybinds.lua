-- tmux navigator found in file, h-j-k-l, tmux prefix leader+ctrl
-- General keymaps
vim.keymap.set("n", "<leader>wq", ":wq<CR>")       -- save and quit
vim.keymap.set("n", "<leader>wqq", ":wqa<CR>")     -- save and quit
vim.keymap.set("n", "<leader>qq", ":q!<CR>")       -- quit without saving
vim.keymap.set("n", "<leader>ww", ":w<CR>")        -- save
vim.keymap.set("n", "gx", ":!open <c-r><c-a><CR>") -- open URL under cursor

-- Split window management
vim.keymap.set("n", "<leader>sv", "<C-w>v")     -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s")     -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=")     -- make split windows equal width
vim.keymap.set("n", "<leader>sx", ":close<CR>") -- close split window
vim.keymap.set("n", "<leader>sj", "<C-w>-")     -- make split window height shorter
vim.keymap.set("n", "<leader>sk", "<C-w>+")     -- make split windows height taller
vim.keymap.set("n", "<leader>sl", "<C-w>>5")    -- make split windows width bigger
vim.keymap.set("n", "<leader>sh", "<C-w><5")    -- make split windows width smaller

-- Yank into system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y') -- yank motion
vim.keymap.set({ "n", "v" }, "<leader>Y", '"+Y') -- yank line

-- Delete into system clipboard
vim.keymap.set({ "n", "v" }, "<leader>d", '"+d') -- delete motion
vim.keymap.set({ "n", "v" }, "<leader>D", '"+D') -- delete line

-- Paste from system clipboard
vim.keymap.set("n", "<leader>p", '"+p') -- paste after cursor
vim.keymap.set("n", "<leader>P", '"+P') -- paste before cursor

vim.keymap.set("n", "<C-n>", ":Neotree filesystem toggle left<CR>", {})

-- windows/linux
vim.keymap.set("n", "<Esc-j>", ":m .+1<CR>==")     -- move line up(n)
vim.keymap.set("n", "<Esc-k>", ":m .-2<CR>==")     -- move line down(n)
vim.keymap.set("v", "<Esc-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
vim.keymap.set("v", "<Esc-k>", ":m '<-2<CR>gv=gv") -- move line down(v)

-- neovim pane movement
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

-- none-ls
vim.keymap.set("n", "<leader>gf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>")
vim.keymap.set("v", "<leader>gf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>")

vim.keymap.set("n", "<leader>gg", "<cmd>lua vim.lsp.buf.hover()<CR>")

vim.keymap.set("n", "<leader>gp", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
vim.keymap.set("n", "<leader>gn", "<cmd>lua vim.diagnostic.goto_next()<CR>")

vim.keymap.set("n", "<leader>ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
vim.keymap.set("n", "<leader>rr", "<cmd>lua vim.lsp.buf.rename()<CR>")

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

--harpoon
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
vim.keymap.set("n", "<C-S-P>", function()
  harpoon:list():prev()
end)
vim.keymap.set("n", "<C-S-N>", function()
  harpoon:list():next()
end)

-- lsp-config (code actions, definitions, etc)
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

-- Debugging
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
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.scopes)
end)
vim.keymap.set("n", "<leader>df", "<cmd>Telescope dap frames<cr>")
vim.keymap.set("n", "<leader>dh", "<cmd>Telescope dap commands<cr>")
vim.keymap.set("n", "<leader>de", function()
  require("telescope.builtin").diagnostics({ default_text = ":E:" })
end)

-- error
vim.keymap.set("n", "<C-e>", ":Telescope noice<CR>")

-- oil
vim.keymap.set("n", "<C-o>", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- bufferline close
vim.keymap.set("n", "<leader>q", ":Bdelete<CR>")

--unit testing
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

-- bufferline
vim.keymap.set("n", "<leader>bn", "<cmd>BufferLineCycleNext<cr>")
vim.keymap.set("n", "<leader>bm", "<cmd>BufferLineCyclePrev<cr>")
vim.keymap.set("n", "<leader>bp", "<cmd>BufferLineTogglePin<cr>")
vim.keymap.set("n", "<leader>bx", "<cmd>BufferLineCloseOthers<cr>")

-- Dooing
vim.keymap.set("n", "<leader>td", "<cmd>Dooing<cr>")

-- substitute
vim.keymap.set("n", "s", require("substitute").operator, {
  noremap = true,
})
vim.keymap.set("n", "ss", require("substitute").line, { noremap = true })
vim.keymap.set("n", "S", require("substitute").eol, { noremap = true })
vim.keymap.set("x", "s", require("substitute").visual, { noremap = true })

-- For default preset
vim.keymap.set("n", "<leader>m", require("treesj").toggle)
-- For extending default preset with `recursive = true`
vim.keymap.set("n", "<leader>M", function()
  require("treesj").toggle({ split = { recursive = true } })
end)

-- neoscroll
local scroll = require("neoscroll").scroll
vim.keymap.set("n", "<C-u>", function() scroll(-10, { move_cursor = true, duration = 200 }) end)
vim.keymap.set("n", "<C-d>", function() scroll(10, { move_cursor = true, duration = 200 }) end)
