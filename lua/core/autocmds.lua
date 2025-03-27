------------------ TRIM TRAILING WHITESPACE ------------------

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	command = ":%s/\\s\\+$//e",
})

------------------ SNACKS DASHBOARD (UI CLEANUP) ------------------

vim.api.nvim_create_autocmd("FileType", {
	pattern = "snacks_dashboard",
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
	end,
})

------------------ LAZY PROFILE (AUTO RUN ON SLOW STARTUP) ------------------

vim.api.nvim_create_autocmd("User", {
	pattern = "LazyVimStarted",
	callback = function()
		vim.defer_fn(function()
			local startup_time = require("lazy").stats().startuptime
			if startup_time > 300 then
				vim.cmd("Lazy profile")
			end
		end, 500)
	end,
})

------------------ TERMINAL FIXES (DISABLE INDENTSCOPE) ------------------

vim.api.nvim_create_autocmd("TermOpen", {
	callback = function()
		vim.b.miniindentscope_disable = true
	end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		-- Override cmdline highlight for Noice:
		vim.api.nvim_set_hl(0, "NoiceCmdline", { fg = "#FAF9F6" })
		-- Override the Comment group if needed:
		vim.api.nvim_set_hl(0, "Comment", { fg = "#6a6a6a" })
		-- You can also override thecmd highlight for keywords that are causing the issue,
		-- e.g., if quotes are using a Treesitter group like "@string" or "@text.literal":
		vim.api.nvim_set_hl(0, "@string", { fg = "#FAF9F6" })
	end,
})
