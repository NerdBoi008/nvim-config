-- Insert mode escape mappings
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })

-- Esc clears search highlighting
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true })

vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Floating terminal" })
vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", { desc = "Horizontal terminal" })
vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", { desc = "Vertical terminal" })

-- Buffer navigation with bufferline
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next buffer", silent = true })
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer", silent = true })
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer", silent = true })
vim.keymap.set("n", "<leader>bp", ":BufferLineTogglePin<CR>", { desc = "Pin buffer", silent = true })
vim.keymap.set(
	"n",
	"<leader>bP",
	":BufferLineGroupClose ungrouped<CR>",
	{ desc = "Delete non-pinned buffers", silent = true }
)

-- Move buffers
vim.keymap.set("n", "<leader>bl", ":BufferLineMoveNext<CR>", { desc = "Move buffer right", silent = true })
vim.keymap.set("n", "<leader>bh", ":BufferLineMovePrev<CR>", { desc = "Move buffer left", silent = true })

-- LSP keybindings
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })

-- Diagnostic keybindings (for viewing errors)
vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, { desc = 'Signature help' })
