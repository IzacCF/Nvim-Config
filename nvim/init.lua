vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- requires
require("core.options")
require("core.keymaps")
require("core.plugins")
require("core.plugin_config")



-- Sintax Highlight sob cursor
vim.cmd [[
  augroup Hover
    autocmd!
    autocmd CursorHold * lua vim.lsp.buf.hover()
  augroup END
]]
-- Config do mouse  - Alterar o destaque da linha do cursor ao entrar/sair do modo de Inserção
vim.cmd[[
highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212
autocmd InsertEnter * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=234 guifg=NONE guibg=#1c1c1c
autocmd InsertLeave * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175
]]
--
-- Desativa o cursorline por padrão
vim.opt.cursorline = false
-- Ativa o cursorline com underline no modo de inserção
vim.api.nvim_create_autocmd("InsertEnter", {
    callback = function()
        vim.opt.cursorline = true
        vim.api.nvim_set_hl(0, 'CursorLine', { underline = true })
    end,
})
-- Desativa o cursorline quando sair do modo de inserção
vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function()
        vim.opt.cursorline = false
    end,
})


--------- ATIVAÇÃO DE PLUGINS ------------

-- Indent hlchunk 
require('hlchunk').setup({
    chunk = {
        enable = true
        -- ...
    },
    indent = {
        enable = true
        -- ...
    }
})
--

-- Cokeline
local get_hex = require('cokeline.hlgroups').get_hl_attr

require('cokeline').setup({
  default_hl = {
    fg = function(buffer)
      return
        buffer.is_focused
        and get_hex('Normal', 'fg')
         or get_hex('Comment', 'fg')
    end,
    bg = get_hex('ColorColumn', 'bg'),
  },
    sidebar = {
    filetype = {'NvimTree', 'neo-tree'},
    components = {
      {
        text = function(buf)
          return buf.filetype
        end,
        fg = yellow,
        bg = function() return get_hex('NvimTreeNormal', 'bg') end,
        bold = true,
      },
    }
  },
  components = {
    {
      text = function(buffer) return (buffer.index ~= 1) and '▏' or '' end,
      fg = function() return get_hex('Normal', 'fg') end
    },
    {
      text = function(buffer) return '    ' .. buffer.devicon.icon end,
      fg = function(buffer) return buffer.devicon.color end,
    },
    {
      text = function(buffer) return buffer.filename .. '    ' end,
      bold = function(buffer) return buffer.is_focused end
    },
    {
      text = '󰖭',
      on_click = function(_, _, _, _, buffer)
        buffer:delete()
      end
    },
    {
      text = '  ',
    },
  },
})
--

-- LSP Kind
local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup({
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text',  -- mostra tanto o ícone quanto o texto
      maxwidth = 50,         -- largura máxima para o menu
      ellipsis_char = '...', -- adiciona '...' para texto cortado
    })
  },
  -- Suas demais configurações do cmp aqui
})
--

---   Python Completion   ---
require'lspconfig'.pyright.setup{
    on_attach = function(client, bufnr)
        -- Configurações que serão aplicadas ao anexar o LSP ao buffer
        -- Como por exemplo, mapeamentos de teclas específicos para o LSP
    end,
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "strict",  -- Configuração para verificação de tipo rigorosa
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
            },
        },
    },
}
vim.g.python3_host_prog = '~/venv/bin/python'

-- Java Completion  ---
vim.cmd([[ let extension = expand('%:e') ]])
vim.cmd([[
	function! JaqCompletion(lead, cmd, cursor)
		let valid_args = [ 'internal', 'float', 'terminal', 'bang', 'quickfix' ]
		let l = len(a:lead) - 1
		if l >= 0
			let filtered_args = copy(valid_args)
			call filter(filtered_args, {_, v -> v[:l] ==# a:lead})
			if !empty(filtered_args)
				return filtered_args
			endif
		endif
		return valid_args
	endfunction

	command! -nargs=? -complete=customlist,JaqCompletion Jaq :lua require('jaq-nvim').Jaq(<f-args>)
]])
require("lspconfig").jdtls.setup({})
--

--  Noice Setup
require("noice").setup({
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, 
    },
  },
  presets = {
    -- Ativa transparência nas notificações LSP
    bottom_search = true, -- desativa a linha de comando na parte inferior
    command_palette = false, -- desativa a paleta de comandos no topo
    long_message_to_split = true, -- mensagens longas vão para um split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
    lsp_doc_border = true,
  },
  background_colour = "#000000",
})
--

-- Notify
require("notify").setup({
  background_colour = "#000000", -- Você pode substituir "#1e1e1e" pela cor de sua preferência
})
--

-- SmoothCursor
require('smoothcursor').setup({
    type = "default",           -- Cursor movement calculation method, choose "default", "exp" (exponential) or "matrix".

    cursor = "",              -- Cursor shape (requires Nerd Font). Disabled in fancy mode.
    texthl = "SmoothCursor",   -- Highlight group. Default is { bg = nil, fg = "#FFD400" }. Disabled in fancy mode.
    linehl = nil,              -- Highlights the line under the cursor, similar to 'cursorline'. "CursorLine" is recommended. Disabled in fancy mode.

    fancy = {
        enable = true,        -- enable fancy mode
        head = { cursor = "▷", texthl = "SmoothCursor", linehl = nil }, -- false to disable fancy head
        body = {
            { cursor = "󰝥", texthl = "SmoothCursorRed" },
            { cursor = "󰝥", texthl = "SmoothCursorOrange" },
            { cursor = "●", texthl = "SmoothCursorYellow" },
            { cursor = "●", texthl = "SmoothCursorGreen" },
            { cursor = "•", texthl = "SmoothCursorAqua" },
            { cursor = ".", texthl = "SmoothCursorBlue" },
            { cursor = ".", texthl = "SmoothCursorPurple" },
        },
        tail = { cursor = nil, texthl = "SmoothCursor" } -- false to disable fancy tail
    },

    matrix = {  -- Loaded when 'type' is set to "matrix"
        head = {
            -- Picks a random character from this list for the cursor text
            cursor = require('smoothcursor.matrix_chars'),
            -- Picks a random highlight from this list for the cursor text
            texthl = {
                'SmoothCursor',
            },
            linehl = nil,  -- No line highlight for the head
        },
        body = {
            length = 6,  -- Specifies the length of the cursor body
            -- Picks a random character from this list for the cursor body text
            cursor = require('smoothcursor.matrix_chars'),
            -- Picks a random highlight from this list for each segment of the cursor body
            texthl = {
                'SmoothCursorGreen',
            },
        },
        tail = {
            -- Picks a random character from this list for the cursor tail (if any)
            cursor = nil,
            -- Picks a random highlight from this list for the cursor tail
            texthl = {
                'SmoothCursor',
            },
        },
        unstop = false,  -- Determines if the cursor should stop or not (false means it will stop)
    },

    autostart = true,           -- Automatically start SmoothCursor
    always_redraw = true,       -- Redraw the screen on each update
    flyin_effect = nil,         -- Choose "bottom" or "top" for flying effect
    speed = 25,                 -- Max speed is 100 to stick with your current position
    intervals = 35,             -- Update intervals in milliseconds
    priority = 10,              -- Set marker priority
    timeout = 3000,             -- Timeout for animations in milliseconds
    threshold = 3,              -- Animate only if cursor moves more than this many lines
    max_threshold = nil,        -- If you move more than this many lines, don't animate (if `nil`, deactivate check)
    disable_float_win = false,  -- Disable in floating windows
    enabled_filetypes = nil,    -- Enable only for specific file types, e.g., { "lua", "vim" }
    disabled_filetypes = nil,   -- Disable for these file types, ignored if enabled_filetypes is set. e.g., { "TelescopePrompt", "NvimTree" }
    -- Show the position of the latest input mode positions. 
    -- A value of "enter" means the position will be updated when entering the mode.
    -- A value of "leave" means the position will be updated when leaving the mode.
    -- `nil` = disabled
    show_last_positions = nil,  
})
--

-- Check-Health
vim.diagnostic.disable(0)
--

-- Wilder Plugin
local wilder = require('wilder')
wilder.setup({modes = {':', '/', '?'}})
--

-- Oil Plugin
require("oil").setup()
--

-- TailWind
require("tailwind-tools").setup({
  ---@type TailwindTools.Option
{
  server = {
    override = true, -- setup the server from the plugin if true
    settings = {}, -- shortcut for `settings.tailwindCSS`
    on_attach = function(client, bufnr) end, -- callback triggered when the server attaches to a buffer
  },
  document_color = {
    enabled = true, -- can be toggled by commands
    kind = "inline", -- "inline" | "foreground" | "background"
    inline_symbol = "󰝤 ", -- only used in inline mode
    debounce = 200, -- in milliseconds, only applied in insert mode
  },
  conceal = {
    enabled = false, -- can be toggled by commands
    min_length = nil, -- only conceal classes exceeding the provided length
    symbol = "󱏿", -- only a single character is allowed
    highlight = { -- extmark highlight options, see :h 'highlight'
      fg = "#38BDF8",
    },
  },
  cmp = {
    highlight = "foreground", -- color preview style, "foreground" | "background"
  },
  telescope = {
    utilities = {
      callback = function(name, class) end, -- callback used when selecting an utility class in telescope
    },
  },
  -- see the extension section to learn more
  extension = {
    queries = {}, -- a list of filetypes having custom `class` queries
    patterns = { -- a map of filetypes to Lua pattern lists
      -- example:
      -- rust = { "class=[\"']([^\"']+)[\"']" },
      -- javascript = { "clsx%(([^)]+)%)" },
    },
  },
}
})
--

-- AutoSave
require("auto-save").setup{
    enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
    execution_message = {
		message = function() -- message to print on save
			return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
		end,
		dim = 0.18, -- dim the color of `message`
		cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
	},
    trigger_events = {"InsertLeave", "TextChanged"}, -- vim events that trigger auto-save. See :h events
	-- function that determines whether to save the current buffer or not
	-- return true: if buffer is ok to be saved
	-- return false: if it's not ok to be saved
	condition = function(buf)
		local fn = vim.fn
		local utils = require("auto-save.utils.data")

		if
			fn.getbufvar(buf, "&modifiable") == 1 and
			utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
			return true -- met condition(s), can save
		end
		return false -- can't save
	end,
    write_all_buffers = false, -- write all buffers when the current one meets `condition`
    debounce_delay = 135, -- saves the file at most every `debounce_delay` milliseconds
	callbacks = { -- functions to be executed at different intervals
		enabling = nil, -- ran when enabling auto-save
		disabling = nil, -- ran when disabling auto-save
		before_asserting_save = nil, -- ran before checking `condition`
		before_saving = nil, -- ran before doing the actual save
		after_saving = nil -- ran after doing the actual save
	}
}
--


-- RipSubstitute settings
require("rip-substitute").setup {
	popupWin = {
		title = " rip-substitute",
		border = "single",
		matchCountHlGroup = "Keyword",
		noMatchHlGroup = "ErrorMsg",
		hideSearchReplaceLabels = false,
		---@type "top"|"bottom"
		position = "bottom",
	},
	prefill = {
		---@type "cursorWord"| false
		normal = "cursorWord",
		---@type "selectionFirstLine"| false does not work with ex-command (see README).
		visual = "selectionFirstLine",
		startInReplaceLineIfPrefill = false,
		alsoPrefillReplaceLine = false,
	},
	keymaps = { -- normal & visual mode, if not stated otherwise
		abort = "q",
		confirm = "<CR>",
		insertModeConfirm = "<C-CR>",
		prevSubst = "<Up>",
		nextSubst = "<Down>",
		toggleFixedStrings = "<C-f>", -- ripgrep's `--fixed-strings`
		toggleIgnoreCase = "<C-c>", -- ripgrep's `--ignore-case`
		openAtRegex101 = "R",
	},
	incrementalPreview = {
		matchHlGroup = "IncSearch",
		rangeBackdrop = {
			enabled = true,
			blend = 50, -- between 0 and 100
		},
	},
	regexOptions = {
		startWithFixedStringsOn = false,
		startWithIgnoreCase = false,
		-- pcre2 enables lookarounds and backreferences, but performs slower
		pcre2 = true,
		-- disable if you use named capture groups (see README for details)
		autoBraceSimpleCaptureGroups = true,
	},
	editingBehavior = {
		-- When typing `()` in the `search` line, automatically adds `$n` to the
		-- `replace` line.
		autoCaptureGroups = false,
	},
	notificationOnSuccess = true,
}
--

-- Colorizer setup
  require("colorizer").setup {
      filetypes = { "*" },
      user_default_options = {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = true, -- "Name" codes like Blue or blue
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        AARRGGBB = true, -- 0xAARRGGBB hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = false, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- Available modes for `mode`: foreground, background,  virtualtext
        mode = "background", -- Set the display mode.
        -- Available methods are false / true / "normal" / "lsp" / "both"
        -- True is same as normal
        tailwind = true, -- Enable tailwind colors
        -- parsers can contain values used in |user_default_options|
        sass = { enable = false, parsers = { "css" }, }, -- Enable sass colors
        virtualtext = "■",
        -- update color values even if buffer is not focused
        -- example use: cmp_menu, cmp_docs
        always_update = false
      },
      -- all the sub-options of filetypes apply to buftypes
      buftypes = {},
  }
--

-- Commentstring
require('ts_context_commentstring').setup {
  enable_autocmd = false,
}
--

-- Wilder
wilder.set_option('renderer', wilder.popupmenu_renderer(
  wilder.popupmenu_border_theme({
    highlights = {
      border = 'Normal', -- highlight to use for the border
    },
    -- 'single', 'double', 'rounded' or 'solid'
    -- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
    border = 'rounded',
  })
))
--

-- Formatter
require('formatter').setup({
  filetype = {
    lua = {
      function()
        return {
          exe = "stylua",
          args = { "--search-parent-directories", "-" },
          stdin = true
        }
      end
    },
    python = {
      function()
        return {
          exe = "black",  -- Certifique-se de ter o 'black' instalado
          args = { "-" },
          stdin = true
        }
      end
    },
    java = {
      function()
        return {
          exe = "clang-format",  -- ou outro formatador compatível com Java
          args = { "--assume-filename", "java" },
          stdin = true
        }
      end
    },
    javascript = {
      function()
        return {
          exe = "prettier",  -- Certifique-se de ter o 'prettier' instalado
          args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote" },
          stdin = true
        }
      end
    },
    html = {
      function()
        return {
          exe = "prettier",
          args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
          stdin = true
        }
      end
    },
    css = {
      function()
        return {
          exe = "prettier",
          args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
          stdin = true
        }
      end
    }
    -- Adicione outras linguagens conforme necessário
  }
})
--

--











