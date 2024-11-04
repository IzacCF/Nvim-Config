require("lazy").setup({

  "JoosepAlviste/nvim-ts-context-commentstring",
  "mattn/emmet-vim",
  "nvim-tree/nvim-tree.lua",
  "folke/twilight.nvim",
  "nvim-tree/nvim-web-devicons",
  "xiyaowong/nvim-cursorword",
  "nvim-lualine/lualine.nvim",
  "nvim-treesitter/nvim-treesitter",
  "vim-test/vim-test",
  "lewis6991/gitsigns.nvim",
  "preservim/vimux",
  "christoomey/vim-tmux-navigator",
  "tpope/vim-fugitive",
  "tpope/vim-surround",
  "mbbill/undotree",

  -- Completion
  {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-emoji",
    "luckasRanarison/tailwind-tools.nvim",
    "onsails/lspkind-nvim",
    -- ...
  },
  opts = function()
    return {
      -- ...
      formatting = {
        format = require("lspkind").cmp_format({
          before = require("tailwind-tools.cmp").lspkind_format
        }),
      },
    }
  end,
},
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true,
        },
}
},
  "hrsh7th/cmp-nvim-lsp",
  "onsails/lspkind-nvim",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  "rafamadriz/friendly-snippets",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  'mhartington/formatter.nvim',
  
-- THEMES
{
  "craftzdog/solarized-osaka.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
},
{"catppuccin/nvim", name = "catppuccin", priority = 1000 },
 "ellisonleao/gruvbox.nvim",
 "rebelot/kanagawa.nvim",
 "tiagovla/tokyodark.nvim",
 "projekt0n/github-nvim-theme",
--
  "echasnovski/mini.icons",
{
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
},
--
  {
    "vinnymeller/swagger-preview.nvim",
    run = "npm install -g swagger-ui-watcher",
  },
--  
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
  },
--  
  {
    "nvim-telescope/telescope.nvim", tag = "0.1.4",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
  "smartpde/telescope-recent-files"
  },  
--
{
	"chrisgrieser/nvim-rip-substitute",
	cmd = "RipSubstitute",
	keys = {
		{
			"<F9>",
			function() require("rip-substitute").sub() end,
			mode = { "n", "x" },
			desc = " rip substitute",
		},
	},
},
--  
  {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
--  
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
    }
},
--
  {
    "goolord/alpha-nvim",
    -- dependencies = { 'echasnovski/mini.icons' },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()   -- -- local: /home/izac/.local/share/nvim/lazy/alpha-nvim/lua/alpha/themes
      local startify = require("alpha.themes.startify")
      --local startify = require("alpha.themes.theta")
            
      -- available: devicons, mini, default is mini
      -- if provider not loaded and enabled is true, it will try to use another provider
      startify.file_icons.provider = "devicons"
      require("alpha").setup(
        startify.config
      )
    end,
  },
--  
{
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("hlchunk").setup({})
  end
},
-- 
{ 'gen740/SmoothCursor.nvim',
  config = function()
    require('smoothcursor').setup()
  end
},
--
{ "stevearc/resession.nvim" },
{
  "willothy/nvim-cokeline",
  dependencies = {
    "nvim-lua/plenary.nvim",        -- Required for v0.4.0+
    "nvim-tree/nvim-web-devicons", -- If you want devicons
    "stevearc/resession.nvim"       -- Optional, for persistent history
  },
  config = true
},
--
{
	"Pocco81/auto-save.nvim",
	config = function()
		 require("auto-save").setup {
			-- your config goes here
			-- or just leave it empty :)
		 }
	end,
},
--
{
        "xiyaowong/nvim-transparent",
		config = function()
			require("core.transparent")
    end,
        config = function()
        require("transparent").setup({
        enable = true, -- Ativa a transparência
        extra_groups = { "NotifyBackground" }, -- Aplica a transparência ao Notify
    })
  end,
},
--
{
		"akinsho/toggleterm.nvim",
--		tag = "*",
		config = function()
			require("core.plugin_config.toggleterm")
		end,
},
--
 {
    "tzachar/highlight-undo.nvim",
    keys = { { "u" }, { "<C-r>" }, { "p" } },
    opts = {
      ...
    },
  },
--
{
  "hedyhli/outline.nvim",
  config = function()
    -- Mapeamento para alternar o outline
    vim.keymap.set("n", "<F10>l", "<cmd>Outline<CR>",
      { desc = "Toggle Outline" })

    -- Configuração do outline
    require("outline").setup {
      outline_window = {
        position = "left", -- Define a posição para a esquerda
        width = 30,        -- Define a largura em colunas
        winhl = '',
      },
    }
  end,
},
--
{
  'gelguy/wilder.nvim',
  config = function()
    -- config goes here
  end,
},
--
{
  "luckasRanarison/tailwind-tools.nvim",
  name = "tailwind-tools",
  build = ":UpdateRemotePlugins",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim", -- optional
    "neovim/nvim-lspconfig", -- optional
  }
},
--
{
  "roobert/search-replace.nvim",
  config = function()
    require("search-replace").setup({
      -- optionally override defaults
      default_replace_single_buffer_options = "gcI",
      default_replace_multi_buffer_options = "egcI",
    })
  end,
},
--
{
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
},
--

--
})
