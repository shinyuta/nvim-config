-- leader keybind (space)
vim.g.mapleader = " "

-- lazy nvim insertion
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
	change_detection = {
		enabled = true,
		notify = true,
	},
})

vim.lsp.enable({
	"lua_ls",
	"pyright",
	"ts_ls",
	"marksman",
	"html",
	"cssls",
	"jsonls",
	"yamlls",
	"solargraph",
	"gopls",
	"rust_analyzer",
	"jdtls",
	"clangd",
	"eslint",
})

require("core.options")
require("core.keybinds")
require("core.autocmds")
