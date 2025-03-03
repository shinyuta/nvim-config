------------------ OBSIDIAN ------------------

-- Helper to expand paths safely, converting ~ to absolute
local function expand_path(path)
	return vim.fn.expand(path)
end

-- Create new standalone note (no backlink) in a specific folder
local function create_note_in_folder(folder, template_type)
	folder = expand_path(folder)

	vim.ui.input({ prompt = "Note Title: " }, function(title)
		if not title or title == "" then
			print("Note creation cancelled.")
			return
		end

		local note_path = string.format("%s/%s.md", folder, title)
		local template_path = expand_path("~/Desktop/wiki/templates/" .. template_type .. ".md")

		if vim.fn.isdirectory(folder) == 0 then
			vim.fn.mkdir(folder, "p")
		end

		if vim.fn.filereadable(note_path) == 0 then
			if vim.fn.filereadable(template_path) == 1 then
				local template = vim.fn.readfile(template_path)
				local date = os.date("%Y-%m-%d")

				for i, line in ipairs(template) do
					template[i] = line:gsub("{{title}}", title):gsub("{{date}}", date)
				end

				vim.fn.writefile(template, note_path)
				print("Created new note: " .. note_path)
			else
				print("Template not found: " .. template_path)
				return
			end
		else
			print("Note already exists: " .. note_path)
		end

		vim.cmd("edit " .. note_path)
	end)
end

-- Create or link note (linked note with backlink) in current folder
local function create_or_link_note(template_type)
	local current_file = vim.fn.expand("%:t:r") -- Current file name (backlink target)
	local current_dir = vim.fn.expand("%:p:h") -- Current file's directory

	vim.ui.input({ prompt = "Link to note: " }, function(title)
		if not title or title == "" then
			print("Link creation cancelled.")
			return
		end

		local link_text = "[[" .. title .. "]]"
		vim.api.nvim_put({ link_text }, "", true, true)

		local note_path = string.format("%s/%s.md", current_dir, title)
		local template_path = expand_path("~/Desktop/wiki/templates/" .. template_type .. "link.md")

		if vim.fn.filereadable(note_path) == 0 then
			if vim.fn.filereadable(template_path) == 1 then
				local template = vim.fn.readfile(template_path)
				local date = os.date("%Y-%m-%d")

				for i, line in ipairs(template) do
					template[i] =
						line:gsub("{{title}}", title):gsub("{{date}}", date):gsub("{{backlink}}", current_file)
				end

				vim.fn.writefile(template, note_path)
				print("Created new linked note: " .. note_path)
			else
				print("Template not found: " .. template_path)
				return
			end
		else
			print("Linked to existing note.")
		end
	end)
end

-- Obsidian Workflow Keybinds (Markdown-based Personal Knowledge Management)

vim.keymap.set("n", "<leader>wn", ":ObsidianToday<CR>", { noremap = true, silent = true, desc = "Open Today's Note" })
vim.keymap.set("n", "<leader>wP", function()
	create_note_in_folder("~/Desktop/wiki/personal", "note")
end, { noremap = true, silent = true, desc = "Create Personal Note (Standalone)" })
vim.keymap.set("n", "<leader>wY", function()
	create_note_in_folder("~/Desktop/wiki/school/Y3S1", "note")
end, { noremap = true, silent = true, desc = "Create Y3S1 Note (Standalone)" })

vim.keymap.set(
	"n",
	"<leader>ws",
	":ObsidianQuickSwitch<CR>",
	{ noremap = true, silent = true, desc = "Search & Open Note" }
)
vim.keymap.set(
	"n",
	"<leader>wf",
	":ObsidianFollowLink<CR>",
	{ noremap = true, silent = true, desc = "Follow Wiki Link" }
)
vim.keymap.set("n", "<leader>wb", ":ObsidianBacklinks<CR>", { noremap = true, silent = true, desc = "Show Backlinks" })

vim.keymap.set("n", "<leader>wS", function()
	require("telescope.builtin").find_files({
		cwd = expand_path("~/Desktop/wiki"),
		prompt_title = "Search Notes",
	})
end, { noremap = true, silent = true, desc = "Search Notes in Wiki" })

vim.keymap.set("n", "<leader>wc", function()
	create_or_link_note("note")
end, { noremap = true, silent = true, desc = "Create/Link to Note (Full Template with Backlink)" })
vim.keymap.set("n", "<leader>wC", function()
	create_or_link_note("simple")
end, { noremap = true, silent = true, desc = "Create/Link to Note (Simple Template with Backlink)" })

vim.keymap.set("n", "<leader>wL", function()
	local picker = require("telescope.builtin")

	picker.find_files({
		cwd = expand_path("~/Desktop/wiki"),
		prompt_title = "Link to Note",
		attach_mappings = function(_, map)
			local actions = require("telescope.actions")
			local action_state = require("telescope.actions.state")

			map("i", "<CR>", function(bufnr)
				local selection = action_state.get_selected_entry()
				actions.close(bufnr)

				local current_dir = vim.fn.expand("%:p:h")
				local wiki_root = expand_path("~/Desktop/wiki")
				local selected_path = selection.path

				local relative_path = selected_path:gsub("^" .. wiki_root .. "/", "")
				local link_text

				if vim.fn.fnamemodify(current_dir, ":p") == vim.fn.fnamemodify(selected_path, ":h:p") then
					link_text = "[[" .. vim.fn.fnamemodify(relative_path, ":t:r") .. "]]"
				else
					link_text = "[[" .. relative_path:gsub("%.md$", "") .. "]]"
				end

				vim.api.nvim_put({ link_text }, "", true, true)
			end)

			return true
		end,
	})
end, { noremap = true, silent = true, desc = "Insert Link to Existing Note (Telescope)" })
