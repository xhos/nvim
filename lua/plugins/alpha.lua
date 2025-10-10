return {
  'goolord/alpha-nvim',
  config = function()
    local alpha = require('alpha')
    local dashboard = require('alpha.themes.dashboard')

    local function get_random_header()
      local ascii_dir = vim.fn.stdpath('config') .. '/ascii'
      local files = vim.fn.glob(ascii_dir .. '/*.lua', 0, 1)

      if #files == 0 then
        return nil
      end

      local random_file = files[math.random(#files)]
      local success, header_data = pcall(dofile, random_file)

      if success and header_data then
        return header_data
      else
        return nil
      end
    end

    local header = get_random_header()
    if header then
      dashboard.section.header = header
    else
      dashboard.section.header.val = { "No ASCII art found" }
    end

    dashboard.section.buttons.val = {
      dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
      dashboard.button("r", "  Recent", ":Telescope oldfiles<CR>"),
      dashboard.button("s", "  Settings", ":e $MYVIMRC<CR>"),
      dashboard.button("q", "  Quit", ":qa<CR>"),
    }

    dashboard.config.layout = {
      dashboard.section.header,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
    }

    alpha.setup(dashboard.config)
  end,
  dependencies = { 'nvim-tree/nvim-web-devicons' }
}
