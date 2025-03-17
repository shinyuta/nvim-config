local M = {}

M.load_extension = function(name)
	local ok, _ = pcall(require("telescope").load_extension, name)
	if not ok then
		vim.notify("Telescope extension '" .. name .. "' failed to load", vim.log.levels.ERROR)
	end
end

M.load_common_extensions = function()
	local extensions = { "zoxide", "project", "noice", "yank_history" }
	for _, ext in ipairs(extensions) do
		M.load_extension(ext)
	end
end

return M
