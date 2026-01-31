return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "master",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local builtin = require("telescope.builtin")

			telescope.setup({
				defaults = {
					hidden = true,
					file_ignore_patterns = {
						"node_modules",
						".git/",
						".next/",
						"dist/",
						"build/",
					},
					mappings = {
						i = {
							-- This allows you to delete a buffer in the <leader>fb list
							-- by pressing Ctrl + d while in Insert mode
							["<C-d>"] = actions.delete_buffer,
						},
						n = {
							-- This allows you to delete a buffer by pressing d
							-- while in Normal mode inside the Telescope window
							["d"] = actions.delete_buffer,
						},
					},
				},
			})

			-- Your existing Keybindings
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
		end,
	},
}
