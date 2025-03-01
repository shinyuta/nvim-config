-- Encoding and terminal colors
vim.opt.termguicolors = true
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- UI / Appearance
vim.opt.title = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.conceallevel = 2
vim.opt.guicursor = "n-v-c-i:block"
vim.opt.clipboard = "unnamedplus"

-- Indentation
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Splits behavior (cleaner)
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Scrolling / Offsets
vim.opt.scrolloff = 10

-- Search behavior
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false -- Cleaner: don't highlight search unless asked

-- Backspace (for better editing experience)
vim.opt.backspace = { "start", "eol", "indent" }

-- No swap files or backups (git manages versions)
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

-- Popups (completion menu height)
vim.opt.pumheight = 10
vim.opt.completeopt = { "menuone", "noselect" }

-- Command-line appearance (cleaner)
vim.opt.cmdheight = 0 -- Hide cmdline unless needed
vim.opt.showmode = false -- Statusline already shows mode

-- Statusline
vim.opt.laststatus = 3 -- Global statusline (one for all splits)

-- Mouse
vim.opt.mouse = "a"

-- Short messages (reduce noise)
vim.opt.shortmess:append("I")

-- Auto trim trailing whitespace when saving
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	command = ":%s/\\s\\+$//e",
})

-- Special handling for Snacks dashboard (no numbers, clean look)
vim.api.nvim_create_autocmd("FileType", {
	pattern = "snacks_dashboard",
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
	end,
})

-- Diagnostics Configuration (Global)
vim.diagnostic.config({
	virtual_text = false, -- Removes inline errors
	signs = true, -- Keep signs in the left gutter
	underline = true, -- Keeps underline under errors/warnings
	update_in_insert = false, -- Avoid diagnostics while typing
	severity_sort = true, -- Sort diagnostics by severity
	float = {
		border = "rounded",
		focusable = false,
	},
})

-- explicitly stating shell (ZSH)
vim.opt.shell = "/bin/zsh"

-- disable unused providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

-- runtimepath cleaner
local unwanted_paths = {
	vim.fn.expand("~/.vim"),
	vim.fn.expand("~/.vim/after"),
	"/usr/share/vim/vimfiles",
	"/usr/local/share/vim/vimfiles",
}

for _, path in ipairs(unwanted_paths) do
	vim.opt.runtimepath:remove(path)
end
