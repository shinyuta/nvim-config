-- Markdown-specific settings (Obsidian-friendly)

vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.textwidth = 80
vim.opt_local.formatoptions:append("t")

-- Focused writing UI
vim.opt_local.number = true
vim.opt_local.relativenumber = false
vim.opt_local.cursorline = false

-- Spell check (great for notes)
vim.opt_local.spelllang = "en_us"
vim.opt_local.spell = true

-- Better link display in markdown
vim.opt_local.conceallevel = 2

-- Consistent indentation (great if you write code snippets in notes)
vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2
