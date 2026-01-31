return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			-- Check if treesitter is available before configuring
			local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
			if not status_ok then
				return
			end

			treesitter.setup({
				ensure_installed = {
					"typescript",
					"javascript",
					"tsx",
					"json",
					"lua",
					"vim",
					"vimdoc",
					"markdown",
				},
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
				treesitter = false,
			})
		end,
	},
}
