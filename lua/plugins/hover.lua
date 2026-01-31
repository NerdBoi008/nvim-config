return {
  'lewis6991/hover.nvim',
  config = function()
    require('hover').setup({
      init = function()
        require('hover.providers.lsp')
      end,
      preview_opts = {
        border = 'rounded'
      },
      mouse_providers = {
        'hover.providers.lsp'
      },
      mouse_delay = 1000  -- 1 second delay for mouse hover
    })
    
    vim.keymap.set('n', 'K', require('hover').hover, {desc = "hover.nvim"})
  end
}
