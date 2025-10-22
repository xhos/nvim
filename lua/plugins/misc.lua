return {
  'NMAC427/guess-indent.nvim',
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  { 'github/copilot.vim' },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
      -- Set commentstring for plsql files
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'plsql',
        callback = function()
          vim.bo.commentstring = '-- %s'
        end,
      })
    end,
  },
  { 'vyfor/cord.nvim', opts = {} },
  { 'wakatime/vim-wakatime', lazy = false },
  { 'Olical/conjure' },
}
