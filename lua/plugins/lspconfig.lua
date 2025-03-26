return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		capabilities.offsetEncoding = { "utf-16" }

		local function common_on_attach(client, bufnr)
			-- Optional space for future LSP keymaps, etc.
		end

		local servers = {
			lua_ls = {},
			pyright = {},
			ts_ls = {},
			marksman = {},
			html = {},
			cssls = {},
			jsonls = {},
			yamlls = {},
			solargraph = {},
			gopls = {},
			rust_analyzer = {},
			jdtls = {},
			clangd = {},
			eslint = {
				on_attach = function(client, bufnr)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						command = "EslintFixAll",
					})
				end,
			},
		}

		for server, config in pairs(servers) do
			config.capabilities = capabilities
			config.on_attach = common_on_attach
			lspconfig[server].setup(config)
		end
	end,
}
