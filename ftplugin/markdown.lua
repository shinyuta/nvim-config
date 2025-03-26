-- lua/ftplugin/markdown.lua

-- 1) General Markdown UI
vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.textwidth = 80
vim.opt_local.formatoptions:append("t")

-- Focused writing UI
vim.opt_local.number = false
vim.opt_local.relativenumber = false
vim.opt_local.cursorline = false
vim.opt_local.signcolumn = "no"
vim.opt_local.colorcolumn = ""

-- Spell check
vim.opt_local.spelllang = "en_us"
vim.opt_local.spell = true

-- Conceal & indentation for code blocks/links
vim.opt_local.conceallevel = 2
vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2

-- 2) "Center" Markdown Content
--    A. Wrap lines at textwidth=80
--    B. Indent wrapped lines with breakindent
--    C. Add a fixed left margin using breakindentopt=shift:<number>
vim.opt_local.breakindent = true
vim.opt_local.breakindentopt = "shift:20" -- ~20 columns of left margin
vim.opt_local.showbreak = string.rep(" ", 3) -- visual prefix on wrapped lines

-- 3) Slightly softer indentation for wrapped lines
vim.opt_local.linebreak = true
vim.opt_local.breakindentopt:append(",min:20")
