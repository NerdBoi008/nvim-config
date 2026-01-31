return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      -- Keybinding to toggle the tree
      vim.keymap.set('n', '<leader>e', ':Neotree toggle left<CR>', { desc = 'Toggle Neo-tree' })

      require("neo-tree").setup({
        filesystem = {
          filtered_items = {
            visible = true, -- Show dotfiles (like .gitignore) by default
            hide_dotfiles = false,
            hide_gitignored = false,
          },
          follow_current_file = {
            enabled = true, -- Focus the file you are currently editing in the tree
          },
        },
      })
    end,
  }
}
