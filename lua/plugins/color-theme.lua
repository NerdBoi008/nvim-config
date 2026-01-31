return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000, -- Load theme before other plugins
	config = function()
		require("catppuccin").setup({
			flavour = "macchiato", -- latte, frappe, macchiato, mocha
			background = {
				light = "latte",
				dark = "mocha",
			},
			transparent_background = true,
			show_end_of_buffer = false,
			term_colors = true,
			dim_inactive = {
				enabled = false,
				shade = "dark",
				percentage = 0.15,
			},
			no_italic = true,
			no_bold = false,
			no_underline = false,
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = false,
				neotree = true, -- Enable neo-tree integration
				treesitter = true,
				notify = false,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
				native_lsp = {
					enabled = true,
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
					},
					inlay_hints = {
						background = true,
					},
				},
				telescope = true,
				which_key = true,
				bufferline = true, -- Enable bufferline integration
			},
		})

		-- Apply the colorscheme
		vim.cmd.colorscheme("catppuccin")
	end,
}
