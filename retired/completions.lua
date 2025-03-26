return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter", -- Lazy-load for insert mode only
		dependencies = {
			-- Snippet Engine
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",

			-- Completion Sources
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			-- Auto-pairs integration (optional)
			"windwp/nvim-autopairs",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")

			-- Load snippets
			require("luasnip.loaders.from_vscode").lazy_load()
			luasnip.config.setup({})

			-- Automatically insert `()` after selecting function/method items
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

			-- Disable completion in comments
			cmp.setup({
				enabled = function()
					local context = require("cmp.config.context")
					return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
				end,
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body) -- Use LuaSnip for snippet expansion
					end,
				},
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = {
					-- Confirm selection with Enter
					["<CR>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							if luasnip.expandable() then
								luasnip.expand()
							else
								cmp.confirm({ select = true })
							end
						else
							fallback()
						end
					end, { "i", "s" }),

					-- Use Tab to navigate through suggestions
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							if #cmp.get_entries() == 1 then
								cmp.confirm({ select = true }) -- If only one suggestion, confirm it immediately
							else
								cmp.select_next_item()
							end
						elseif luasnip.locally_jumpable(1) then
							luasnip.jump(1)
						else
							fallback()
						end
					end, { "i", "s" }),

					-- Use Shift-Tab to move backwards
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				},
			})

			-- ✅ Enable CMP for `/` and `?` (search mode)
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			-- 🚫 Disable CMP for `:` (Command Mode)
			cmp.setup.cmdline(":", {
				enabled = false,
			})

			-- Disable `treesitter` completion for large files (100KB+)
			local bufIsBig = function(bufnr)
				local max_filesize = 100 * 1024 -- 100 KB
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(bufnr))
				return ok and stats and stats.size > max_filesize
			end

			local default_cmp_sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "nvim_lsp_signature_help" },
			}, {
				{ name = "luasnip" },
				{ name = "path" },
			})

			vim.api.nvim_create_autocmd("BufReadPre", {
				callback = function(t)
					local sources = default_cmp_sources
					if not bufIsBig(t.buf) then
						sources[#sources + 1] = { name = "treesitter", group_index = 2 }
					end
					cmp.setup.buffer({ sources = sources })
				end,
			})
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
	},
}
