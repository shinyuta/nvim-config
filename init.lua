-- ~/.config/nvim/config/init.lua

-- Set your leader key and update PATH for Mason if needed
vim.g.mapleader = " "

local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
if not string.find(vim.env.PATH, mason_bin, 1, true) then
	vim.env.PATH = vim.env.PATH .. ":" .. mason_bin
end

-- lazy.nvim insertion
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

-- Automatically enable all LSP servers based on files in ~/.config/nvim/lsp/
local function setup_lsp()
	local lsp_dir = vim.fn.stdpath("config") .. "/lsp"
	local lsp_servers = {}
	if vim.fn.isdirectory(lsp_dir) == 1 then
		for _, file in ipairs(vim.fn.readdir(lsp_dir)) do
			if file:match("%.lua$") and file ~= "init.lua" then
				local server_name = file:gsub("%.lua$", "")
				table.insert(lsp_servers, server_name)
			end
		end
	end
	vim.lsp.enable(lsp_servers)
end

setup_lsp()

-- Load additional configuration files for options, keybinds, and autocommands
require("core.options")
require("core.keybinds")
require("core.autocmds")
