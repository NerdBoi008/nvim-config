return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    local api = require("Comment.api")
    
    require("Comment").setup({
      -- This allows for context-aware commenting in JSX/TSX/HTML
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    })

    -- Define common options for our keymaps
    local opts = { noremap = true, silent = true }

    -- Toggle line comment with Ctrl + /
    -- Note: Many terminals send Ctrl+/ as <C-_>
    vim.keymap.set("n", "<C-_>", api.toggle.linewise.current, opts)
    vim.keymap.set("n", "<C-/>", api.toggle.linewise.current, opts)

    -- Visual Mode: Toggle selection
    -- We use a cleaner way to handle the visual selection
    local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
    
    vim.keymap.set("v", "<C-_>", function()
      vim.api.nvim_feedkeys(esc, "nx", false)
      api.toggle.linewise(vim.fn.visualmode())
    end, opts)

    -- Shift + Alt + A for Block Comment
    vim.keymap.set("n", "<A-S-a>", api.toggle.blockwise.current, opts)
    vim.keymap.set("v", "<A-S-a>", function()
      vim.api.nvim_feedkeys(esc, "nx", false)
      api.toggle.blockwise(vim.fn.visualmode())
    end, opts)
  end,
}
