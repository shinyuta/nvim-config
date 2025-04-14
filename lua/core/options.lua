------------------ ENCODING & TERMINAL COLORS ------------------

vim.opt.termguicolors = true
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

------------------ APPEARANCE & UI ------------------

vim.opt.title = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.conceallevel = 2
vim.opt.guicursor = "n-v-c-i:block"
vim.opt.clipboard = "unnamedplus"
vim.opt.guicursor = "n-v-c:block-blinkwait700-blinkon400-blinkoff250"
vim.o.winborder = ""

------------------ INDENTATION & TABS ------------------

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

------------------ SPLIT WINDOW BEHAVIOR ------------------

vim.opt.splitright = true
vim.opt.splitbelow = true

------------------ SCROLLING & OFFSETS ------------------

vim.o.scrolloff = 999

------------------ SEARCH BEHAVIOR ------------------

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false -- Cleaner: don't highlight search unless asked

------------------ BACKSPACE BEHAVIOR ------------------

vim.opt.backspace = { "start", "eol", "indent" }

------------------ FILE & BACKUP HANDLING ------------------

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

------------------ POPUP MENUS & COMPLETION ------------------

vim.opt.pumheight = 10
vim.opt.completeopt = { "menuone", "noselect" }

------------------ COMMAND LINE & STATUS LINE ------------------

vim.opt.cmdheight = 0 -- Hide cmdline unless needed
vim.opt.showmode = false -- Statusline already shows mode
vim.opt.laststatus = 3 -- 3 for global, 2 for split.

------------------ MOUSE SUPPORT ------------------

vim.opt.mouse = "a"

------------------ MISC SHORT MESSAGES ------------------

vim.opt.shortmess:append("I")

------------------ DIAGNOSTICS CONFIGURATION ------------------

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

------------------ SHELL CONFIGURATION ------------------

vim.opt.shell = "/bin/zsh"

------------------ DISABLED PROVIDERS (PERFORMANCE) ------------------

vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

------------------ RUNTIMEPATH CLEANUP ------------------

local unwanted_paths = {
	vim.fn.expand("~/.vim"),
	vim.fn.expand("~/.vim/after"),
	"/usr/share/vim/vimfiles",
	"/usr/local/share/vim/vimfiles",
}

for _, path in ipairs(unwanted_paths) do
	vim.opt.runtimepath:remove(path)
end

------------------ DISABLED BUILTIN PLUGINS ------------------

-- Disable built-ins you don’t use
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_gzipPlugin = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
