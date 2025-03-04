local M = {}

M.load_extension = function(name)
	local ok, _ = pcall(require("telescope").load_extension, name)
	if not ok then
		vim.notify("Telescope extension '" .. name .. "' failed to load", vim.log.levels.ERROR)
	end
end

M.load_common_extensions = function()
	M.load_extension("zoxide")
	M.load_extension("project")
	M.load_extension("noice")
	M.load_extension("yank_history")
end

return M
