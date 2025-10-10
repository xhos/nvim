
-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "use h to move, you freak"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "use l to move, you freak"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "use k to move, you freak"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "use j to move, you freak"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Tab navigation keybinds
vim.keymap.set('n', '<leader>tn', '<cmd>tabnew<CR>', { desc = '[T]ab [N]ew' })
vim.keymap.set('n', '<leader>tc', '<cmd>tabclose<CR>', { desc = '[T]ab [C]lose' })
vim.keymap.set('n', '<leader>to', '<cmd>tabonly<CR>', { desc = '[T]ab [O]nly' })
vim.keymap.set('n', 'gt', '<cmd>tabnext<CR>', { desc = 'Next tab' })
vim.keymap.set('n', 'gT', '<cmd>tabprevious<CR>', { desc = 'Previous tab' })

-- File tree keybinds
vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<CR>', { desc = 'Toggle [E]xplorer' })
vim.keymap.set('n', '<leader>E', '<cmd>Neotree reveal<CR>', { desc = 'Reveal current file in [E]xplorer' })

-- Quick save
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = '[W]rite/Save file' })
vim.keymap.set('n', '<C-s>', '<cmd>w<CR>', { desc = 'Save file' })

-- Autosave on focus lost and buffer leave
vim.api.nvim_create_autocmd({'FocusLost', 'BufLeave'}, {
  callback = function()
    if vim.bo.modified and vim.bo.buftype == '' and vim.fn.expand('%') ~= '' then
      vim.cmd('silent! w')
    end
  end,
})

-- TODO: yeah this is bad.
-- Transparency toggle
vim.keymap.set('n', '<leader>tt', function()
  local transparent = vim.g.transparent_enabled or false
  if transparent then
    vim.cmd('colorscheme tokyonight-night')
    vim.g.transparent_enabled = false
    print("Transparency disabled (opaque)")
  else
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
    vim.g.transparent_enabled = true
    print("Transparency enabled")
  end
end, { desc = '[T]oggle [T]ransparency' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })
