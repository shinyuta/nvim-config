-- Markdown specific settings
vim.opt.wrap = true -- Wrap text
vim.opt.linebreak = true -- Line break on whole words

-- Spell check
vim.opt.spelllang = 'en_us'
vim.opt.spell = true

-- obsidian (keybinds) 
vim.keymap.set("n", "<leader>nt", "<cmd>ObsidianNewFromTemplate <CR>")
vim.keymap.set("n", "<leader>to", "<cmd>ObsidianTOC <CR>")
