-- Catppuccin theme
-- require("catppuccin").setup({
--  flavour = "mocha",
--  transparent_background = true,
--  styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
--    comments = { "italic" }, -- Change the style of comments
--  },
-- })


-- Tokyiodark theme
--[[ vim.cmd [[colorscheme tokyodark]]

-- kanagawa theme
-- require('kanagawa').setup({
--     compile = false,             -- enable compiling the colorscheme
--     undercurl = true,            -- enable undercurls
--     commentStyle = { italic = true },
--     functionStyle = {},
--     keywordStyle = { italic = true},
--     statementStyle = { bold = true },
--     typeStyle = {},
--     transparent = true,         -- do not set background color
--     dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
--     terminalColors = true,       -- define vim.g.terminal_color_{0,17}
--     colors = {                   -- add/modify theme and palette colors
--         palette = {},
--         theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
--     },
--     overrides = function(colors) -- add/modify highlights
--         return {}
--     end,
--     theme = "wave",              -- Load "wave" theme when 'background' option is not set
--     background = {               -- map the value of 'background' option to a theme
--         dark = "wave",           -- try "dragon" !
--         light = "lotus"
--     },
-- })
-- vim.cmd("colorscheme kanagawa")


-- Gruvbox theme
-- require("gruvbox").setup({
-- terminal_colors = true, -- add neovim terminal colors
-- undercurl = true,
-- underline = true,
-- bold = true,
-- italic = {
-- 	strings = true,
-- 	emphasis = true,
-- 	comments = true,
-- 	operators = false,
-- 	folds = true,
-- },
-- strikethrough = true,
-- invert_selection = false,
-- invert_signs = false,
-- invert_tabline = false,
-- invert_intend_guides = false,
-- inverse = true, -- invert background for search, diffs, statuslines and errors
-- contrast = "", -- can be "hard", "soft" or empty string
-- palette_overrides = {},
-- overrides = {},
-- dim_inactive = false,
-- transparent_mode = true,
-- })
-- vim.cmd("colorscheme gruvbox")
--

-- Midnight
--require('midnight').setup {
--    HighlightGroup = {
--        fg = ForegroundColor, -- :h guifg
--        bg = BackgroundColor, -- :h guibg
--        sp = SpecialColor, -- :h guisp
--        style = RenderStyle, -- :h attr-list
--        -- OR
--        link = TargetHiglightGroup -- :h :hi-link (link to "TargetHiglightGroup")
--        -- OR
--        --clear = true -- :h :hi-clear (clear "HighlightGroup"; `false` ignores this option)
--    },
--}
--vim.cmd( "colorscheme midnight" )

--  OxoCarbon
-- vim.opt.background = "dark" -- set this to dark or light
-- vim.cmd( " colorscheme oxocarbon" )
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

-- Solarized_Osaka
-- require("solarized-osaka").setup({
--   -- your configuration comes here
--   -- or leave it empty to use the default settings
--   transparent = true, -- Enable this to disable setting the background color
--   terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
--   styles = {
--     -- Style to be applied to different syntax groups
--     -- Value is any valid attr-list value for `:help nvim_set_hl`
--     comments = { italic = true },
--     keywords = { italic = true },
--     functions = {},
--     variables = {},
--     -- Background styles. Can be "dark", "transparent" or "normal"
--     sidebars = "dark", -- style for sidebars, see below
--     floats = "dark", -- style for floating windows
--   },
--   sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
--   day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
--   hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
--   dim_inactive = false, -- dims inactive windows
--   lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
--
--   --- You can override specific color groups to use other groups or a hex color
--   --- function will be called with a ColorScheme table
--   ---@param colors ColorScheme
--   on_colors = function(colors) end,
--
--   --- You can override specific highlights to use other groups or a hex color
--   --- function will be called with a Highlights and ColorScheme table
--   ---@param highlights Highlights
--   ---@param colors ColorScheme
--   on_highlights = function(highlights, colors) end,
-- })
-- vim.cmd[[colorscheme solarized-osaka]]
--

-- GitHub Theme
require('github-theme').setup({
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath('cache') .. '/github-theme',
    compile_file_suffix = '_compiled', -- Compiled file suffix
    hide_end_of_buffer = true, -- Hide the '~' character at the end of the buffer for a cleaner look
    hide_nc_statusline = true, -- Override the underline style for non-active statuslines
    transparent = false,       -- Disable setting bg (make neovim's background transparent)
    terminal_colors = true,    -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false,      -- Non focused panes set to alternative background
    module_default = true,     -- Default enable value for modules
    styles = {                 -- Style to be applied to different syntax groups
      comments = 'NONE',       -- Value is any valid attr-list value `:help attr-list`
      functions = 'NONE',
      keywords = 'NONE',
      variables = 'NONE',
      conditionals = 'NONE',
      constants = 'NONE',
      numbers = 'NONE',
      operators = 'NONE',
      strings = 'NONE',
      types = 'NONE',
    },
    inverse = {                -- Inverse highlight for different types
      match_paren = false,
      visual = false,
      search = false,
    },
    darken = {                 -- Darken floating windows and sidebar-like windows
      floats = true,
      sidebars = {
        enable = true,
        list = {},             -- Apply dark background to specific windows
      },
    },
    modules = {                -- List of various plugins and additional options
      -- ...
    },
  },
  palettes = {},
  specs = {},
  groups = {},
})
vim.cmd('colorscheme github_dark_high_contrast')
--


