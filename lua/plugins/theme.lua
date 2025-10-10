return {
  'folke/tokyonight.nvim',
  priority = 1000,
  config = function()
    require('tokyonight').setup {
      styles = {
        comments = { italic = false },
        sidebars = 'dark',
      },
      on_colors = function(colors)
        colors.bg_sidebar = '#1e2030'
      end,
    }

    vim.cmd.colorscheme 'tokyonight-night'

    -- Apply transparency after colorscheme loads
    vim.g.transparent_enabled = true
    vim.cmd('highlight Normal guibg=NONE ctermbg=NONE')
    vim.cmd('highlight NormalNC guibg=NONE ctermbg=NONE')
    vim.cmd('highlight SignColumn guibg=NONE ctermbg=NONE')
    vim.cmd('highlight NeoTreeNormal guibg=NONE ctermbg=NONE')
    vim.cmd('highlight NeoTreeNormalNC guibg=NONE ctermbg=NONE')
    vim.cmd('highlight StatusLine guibg=NONE ctermbg=NONE')
    vim.cmd('highlight StatusLineNC guibg=NONE ctermbg=NONE')
    vim.cmd('highlight MiniStatuslineModeNormal guibg=NONE ctermbg=NONE')
    vim.cmd('highlight MiniStatuslineModeOther guibg=NONE ctermbg=NONE')
    vim.cmd('highlight MiniStatuslineDevinfo guibg=NONE ctermbg=NONE')
    vim.cmd('highlight MiniStatuslineFilename guibg=NONE ctermbg=NONE')
    vim.cmd('highlight MiniStatuslineFileinfo guibg=NONE ctermbg=NONE')
    vim.cmd('highlight MiniStatuslineInactive guibg=NONE ctermbg=NONE')
  end,
}
