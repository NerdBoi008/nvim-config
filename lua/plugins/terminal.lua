-- return {
-- 	"akinsho/toggleterm.nvim",
-- 	version = "*",
-- 	config = function()
-- 		require("toggleterm").setup({
-- 			size = 20,
-- 			open_mapping = [[<C-\>]],
-- 			hide_numbers = true,
-- 			shade_terminals = true,
-- 			start_in_insert = true,
-- 			insert_mappings = true,
-- 			terminal_mappings = true,
-- 			persist_size = true,
-- 			direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
-- 			close_on_exit = true,
-- 			shell = vim.o.shell,
-- 			float_opts = {
-- 				border = "curved",
-- 				winblend = 0,
-- 			},
-- 		})
--
-- 		-- Custom keybindings
-- 		function _G.set_terminal_keymaps()
-- 			local opts = { buffer = 0 }
-- 			vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
-- 			vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
-- 			vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
-- 			vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
-- 			vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
-- 		end
--
-- 		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
-- 	end,
-- }

return {
	"voldikss/vim-floaterm",
	config = function()
		-- Settings
		vim.g.floaterm_width = 0.8
		vim.g.floaterm_height = 0.8
		vim.g.floaterm_position = "center"
		vim.g.floaterm_titleposition = "center"
		vim.g.floaterm_autoinsert = false
		vim.g.floaterm_borderchars = "─│─│╭╮╯╰"
		vim.g.floaterm_title = "Terminal $1/$2"

		vim.cmd([[
      hi Floaterm guibg=NONE
      hi FloatermBorder guibg=NONE guifg=#6c7086
    ]])

		-- Keybindings
		local keymap = vim.keymap.set
		local opts = { noremap = true, silent = true }

		-- Toggle terminal
		keymap("n", "<C-\\>", ":FloatermToggle<CR>", opts)
		keymap("t", "<C-\\>", "<C-\\><C-n>:FloatermToggle<CR>", opts)

		-- Create new terminal tab
		keymap("n", "<leader>tn", ":FloatermNew<CR>", opts)

		-- Navigate between terminal tabs
		keymap("n", "<leader>]", ":FloatermNext<CR>", opts)
		keymap("n", "<leader>[", ":FloatermPrev<CR>", opts)

		-- Kill current terminal
		keymap("n", "<leader>tk", ":FloatermKill<CR>", opts)

		-- Different shells as new tabs
		keymap("n", "<leader>tw", ":FloatermNew wsl.exe<CR>", opts)
		keymap("n", "<leader>tp", ":FloatermNew pwsh.exe<CR>", opts)
		keymap("n", "<leader>tc", ":FloatermNew cmd.exe<CR>", opts)

		-- Exit terminal mode
		keymap("t", "<Esc>", "<C-\\><C-n>", opts)
	end,
}
