-- Markdown-specific settings (Obsidian-friendly)

vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.textwidth = 100
vim.opt_local.formatoptions:append("t")

-- Focused writing UI (Distraction-free tweaks)
vim.opt_local.number = false
vim.opt_local.relativenumber = false
vim.opt_local.cursorline = false
vim.opt_local.signcolumn = "no"
vim.opt_local.colorcolumn = ""

-- Spell check (great for notes)
vim.opt_local.spelllang = "en_us"
vim.opt_local.spell = true

-- Better link display in markdown
vim.opt_local.conceallevel = 2

-- Consistent indentation (great if you write code snippets in notes)
vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2

-- Soft indent for wrapped lines (paragraph continuation)
vim.opt_local.breakindent = true
vim.opt_local.breakindentopt = "shift:2"
