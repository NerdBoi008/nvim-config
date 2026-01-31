return {
	-- LSP Configuration
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",

			-- Useful status updates
			{ "j-hui/fidget.nvim", opts = {} },
		},
		config = function()
			-- Mason setup
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"ts_ls", -- TypeScript/JavaScript
					"lua_ls", -- Lua
					"eslint", -- ESLint
					"tailwindcss", -- Tailwind
				},
				automatic_installation = true,
			})

			-- LSP keymaps (only active when LSP attaches)
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					map("gd", vim.lsp.buf.definition, "Go to Definition")
					map("gr", vim.lsp.buf.references, "Go to References")
					map("gI", vim.lsp.buf.implementation, "Go to Implementation")
					map("<leader>rn", vim.lsp.buf.rename, "Rename")
					map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
					map("K", vim.lsp.buf.hover, "Hover Documentation")
				end,
			})

			-- Configure LSP servers using new vim.lsp.config API (Neovim 0.11+)
			local capabilities = vim.lsp.protocol.make_client_capabilities()

			-- TypeScript/JavaScript
			vim.lsp.config("ts_ls", {
				cmd = { "typescript-language-server", "--stdio" },
				filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
				root_markers = { "package.json", "tsconfig.json", "jsconfig.json" },
				capabilities = capabilities,
				settings = {
					typescript = {
						inlayHints = {
							includeInlayParameterNameHints = "all",
							includeInlayFunctionParameterTypeHints = true,
						},
					},
				},
			})

			-- ESLint
			vim.lsp.config("eslint", {
				cmd = { "vscode-eslint-language-server", "--stdio" },
				filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
				root_markers = { ".eslintrc", ".eslintrc.js", ".eslintrc.json", "eslint.config.js" },
				capabilities = capabilities,
			})

			-- Lua (for Neovim config)
			vim.lsp.config("lua_ls", {
				cmd = { "lua-language-server" },
				filetypes = { "lua" },
				root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", "stylua.toml" },
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						telemetry = { enable = false },
					},
				},
			})

			-- Tailwind CSS (Add this)
			vim.lsp.config("tailwindcss", {
				cmd = { "tailwindcss-language-server", "--stdio" },
				filetypes = {
					"html",
					"css",
					"scss",
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
				},
				root_markers = { "tailwind.config.js", "tailwind.config.ts" },
				capabilities = capabilities,
			})

			-- Enable LSP servers
			vim.lsp.enable({ "ts_ls", "eslint", "lua_ls", "tailwindcss" })
		end,
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"roobert/tailwindcss-colorizer-cmp.nvim",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping.select_next_item(),
					["<S-Tab>"] = cmp.mapping.select_prev_item(),
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				},
				formatting = {
					format = require("tailwindcss-colorizer-cmp").formatter,
				},
			})
		end,
	},
}
