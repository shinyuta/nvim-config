-- Markdown specific settings
vim.opt.wrap = true -- Wrap text
vim.opt.linebreak = true -- Line break on whole words
vim.opt.textwidth = 80
vim.opt.formatoptions:append("t") -- Enables automatic wrapping

-- removes unnecessary stuff when writing
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.cursorline = false

-- Spell check
vim.opt.spelllang = "en_us"
vim.opt.spell = true

-- obsidian (keybinds)
vim.keymap.set("n", "<leader>nt", "<cmd>ObsidianNewFromTemplate <CR>")
vim.keymap.set("n", "<leader>to", "<cmd>ObsidianTOC <CR>")
