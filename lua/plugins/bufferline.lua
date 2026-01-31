return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = "VeryLazy",
	opts = {
		options = {
			mode = "buffers", -- set to "tabs" to only show tabpages instead
			themable = true,
			numbers = "none", -- can be "none" | "ordinal" | "buffer_id" | "both"
			close_command = "bdelete! %d",
			right_mouse_command = "bdelete! %d",
			left_mouse_command = "buffer %d",
			middle_mouse_command = nil,
			indicator = {
				icon = "▎", -- this should be omitted if indicator style is not 'icon'
				style = "icon", -- can be 'icon' or 'underline' or 'none'
			},
			buffer_close_icon = "󰅖",
			modified_icon = "●",
			close_icon = "",
			left_trunc_marker = "",
			right_trunc_marker = "",
			diagnostics = "nvim_lsp", -- can be "nvim_lsp" | "coc" | false
			diagnostics_indicator = function(count, level)
				local icon = level:match("error") and " " or " "
				return " " .. icon .. count
			end,
			-- Offset neo-tree
			offsets = {
				{
					filetype = "neo-tree",
					text = "File Explorer",
					text_align = "center",
					separator = true,
				},
			},
			color_icons = true,
			show_buffer_icons = true,
			show_buffer_close_icons = true,
			show_close_icon = true,
			show_tab_indicators = true,
			separator_style = "thin", -- can be "slant" | "slope" | "thick" | "thin" | "padded_slant"
			always_show_bufferline = true,
			hover = {
				enabled = true,
				delay = 200,
				reveal = { "close" },
			},
		},
	},
}
