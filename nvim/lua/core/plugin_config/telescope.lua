require('telescope').setup({ file_ignore_patterns = { "node%_modules/.*" } })
local builtin = require('telescope.builtin')

--vim.keymap.set('n', '<c-p>', builtin.find_files, {})
--vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {})
--vim.keymap.set('n', '<Space>fg', builtin.live_grep, {})
--vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})
-- Telescope
vim.api.nvim_set_keymap('n', '<leader>t', ':Telescope find_files<CR>', { noremap = true, silent = true })

require("solarized-osaka").setup({
  on_highlights = function(hl, c)
    local prompt = "#2d3149"
    hl.TelescopeNormal = {
      bg = c.bg_dark,
      fg = c.fg_dark,
    }
    hl.TelescopeBorder = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
    hl.TelescopePromptNormal = {
      bg = prompt,
    }
    hl.TelescopePromptBorder = {
      bg = prompt,
      fg = prompt,
    }
    hl.TelescopePromptTitle = {
      bg = prompt,
      fg = prompt,
    }
    hl.TelescopePreviewTitle = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
    hl.TelescopeResultsTitle = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
  end,
})
