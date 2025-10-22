return {
  'datsfilipe/min-theme.nvim',
  priority = 1000,
  config = function()
    require('min-theme').setup({
      theme = 'dark',
      transparent = true,
      italics = {
        comments = false,
        keywords = true,
        functions = true,
        strings = true,
        variables = true,
      },
    })

    vim.cmd.colorscheme('min-theme')

    -- Apply additional transparency for specific elements
    vim.g.transparent_enabled = true
    vim.cmd('highlight NeoTreeNormal guibg=NONE ctermbg=NONE')
    vim.cmd('highlight NeoTreeNormalNC guibg=NONE ctermbg=NONE')
    vim.cmd('highlight MiniStatuslineModeNormal guibg=NONE ctermbg=NONE')
    vim.cmd('highlight MiniStatuslineModeOther guibg=NONE ctermbg=NONE')
    vim.cmd('highlight MiniStatuslineDevinfo guibg=NONE ctermbg=NONE')
    vim.cmd('highlight MiniStatuslineFilename guibg=NONE ctermbg=NONE')
    vim.cmd('highlight MiniStatuslineFileinfo guibg=NONE ctermbg=NONE')
    vim.cmd('highlight MiniStatuslineInactive guibg=NONE ctermbg=NONE')
  end,
}
