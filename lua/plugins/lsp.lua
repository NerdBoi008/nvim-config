-- return {
-- 	{
-- 		"neovim/nvim-lspconfig",
-- 		dependencies = {
-- 			"hrsh7th/cmp-nvim-lsp",
-- 			"b0o/SchemaStore.nvim",
-- 		},
-- 		config = function()
-- 			-- 1. Load the configurations into the native vim.lsp.config table
-- 			-- (This makes the plugin's server definitions available to Neovim)
-- 			require("lspconfig")
--
-- 			local capabilities = require("cmp_nvim_lsp").default_capabilities()
--
-- 			-- 2. Configure the server using the NEW syntax
-- 			-- This acts like the old .setup() but is 0.11 compliant
-- 			vim.lsp.config("ts_ls", {
-- 				capabilities = capabilities,
-- 			})
--
-- 			-- 3. Configure JSON server with SchemaStore
-- 			vim.lsp.config("jsonls", {
-- 				capabilities = capabilities,
-- 				settings = {
-- 					json = {
-- 						schemas = require("schemastore").json.schemas(),
-- 						validate = { enable = true },
-- 					},
-- 				},
-- 			})
--
-- 			-- 4. Explicitly enable the server
-- 			vim.lsp.enable("ts_ls")
-- 			vim.lsp.enable("jsonls")
-- 		end,
-- 	},
-- }

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"b0o/SchemaStore.nvim",
		},
		config = function()
			require("lspconfig")

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true

			-- TypeScript server
			vim.lsp.config("ts_ls", {
				capabilities = capabilities,
			})

			-- JSON server with SchemaStore
			vim.lsp.config("jsonls", {
				capabilities = capabilities,
				settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
						validate = { enable = true },
					},
				},
			})

			-- Emmet language server
			vim.lsp.config("emmet_language_server", {
				cmd = { "emmet-language-server", "--stdio" },
				capabilities = capabilities,
				filetypes = {
					"css",
					"html",
					"javascript",
					"javascriptreact",
					"scss",
					"typescript",
					"typescriptreact",
				},
			})
			vim.lsp.config("tailwindcss", {
				capabilities = capabilities,
			})

			vim.lsp.enable("tailwindcss")
			vim.lsp.enable("ts_ls")
			vim.lsp.enable("jsonls")
			vim.lsp.enable("emmet_language_server")
		end,
	},
}
