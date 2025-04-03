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

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})
