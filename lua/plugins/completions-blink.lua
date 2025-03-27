return {
	{
		"saghen/blink.cmp",
		version = "1.*", -- use a release tag to download pre-built binaries automatically
		dependencies = {
			-- Snippet engine + snippet collection (optional but highly recommended)
			{
				"L3MON4D3/LuaSnip",
				version = "v2.*",
				build = "make install_jsregexp", -- recommended build step for LuaSnip
			},
			"rafamadriz/friendly-snippets",
		},
		opts = {

			-------------------------------------------------------------------------
			--  A) KEYMAP PRESET
			-------------------------------------------------------------------------
			-- 'super-tab' gives tab/shift-tab for acceptance, plus normal arrow keys
			-- and <C-y> by default.  We'll rely on the built-in super-tab logic
			-- rather than writing custom functions for minimal setup.
			keymap = {
				preset = "none",
				["<CR>"] = { "accept", "fallback" }, -- Enter to confirm
				["<Tab>"] = {
					-- If a snippet is active, jump forward; otherwise select next item
					function(cmp)
						if cmp.snippet_active() then
							return cmp.snippet_forward()
						else
							return cmp.select_next({ auto_insert = false })
						end
					end,
					"fallback",
				},
				["<S-Tab>"] = {
					-- If a snippet is active, jump backward; otherwise select previous item
					function(cmp)
						if cmp.snippet_active() then
							return cmp.snippet_backward()
						else
							return cmp.select_prev({ auto_insert = false })
						end
					end,
					"fallback",
				},
				["<C-e>"] = { "hide", "fallback" }, -- Hide menu
			},

			-------------------------------------------------------------------------
			--  B) SNIPPETS
			-------------------------------------------------------------------------
			-- Tells Blink to integrate with LuaSnip for snippet expansion & jumping
			snippets = { preset = "luasnip" },

			-------------------------------------------------------------------------
			--  C) SOURCES
			-------------------------------------------------------------------------
			-- The default set of providers: LSP, path, snippet expansions, buffer text
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},

			-------------------------------------------------------------------------
			--  D) FUZZY
			-------------------------------------------------------------------------
			-- Use Rust if possible (pre-built binary). Fallback to Lua if unavailable,
			-- showing a warning once.
			fuzzy = { implementation = "prefer_rust_with_warning" },

			-------------------------------------------------------------------------
			--  E) SIGNATURE HELP (OPTIONAL)
			-------------------------------------------------------------------------
			-- This is experimental but can be useful for showing function signatures.
			signature = { enabled = true },

			-------------------------------------------------------------------------
			--  F) COMPLETION MENU & DOCUMENTATION
			-------------------------------------------------------------------------
			completion = {
				-- Show docs automatically on selection, after 500ms
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 500,
				},
				-- Show a small "ghost text" preview? (Disabled here)
				ghost_text = { enabled = false },

				-- Behavior for the list of completion items
				list = {
					selection = {
						preselect = true, -- automatically select the first item
						auto_insert = true, -- automatically insert text on selection
					},
				},
			},

			-------------------------------------------------------------------------
			--  G) CMDLINE
			-------------------------------------------------------------------------
			cmdline = {
				enabled = false,
			},

			-------------------------------------------------------------------------
			--  H) TERMINAL COMPLETIONS
			-------------------------------------------------------------------------
			-- Terminal completions are only fully supported on Neovim 0.11+ (nightly).
			-- We'll disable them for minimal config.
			term = { enabled = true },
		},
		-- Merges default sources with ours
		opts_extend = { "sources.default" },
	},
}
