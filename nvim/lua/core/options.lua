vim.cmd([[ let extension = expand('%:e') ]])

vim.cmd([[
  filetype plugin indent on
  syntax on
]])

vim.cmd [[ set noswapfile ]]
vim.cmd [[ set termguicolors ]]
--

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.visualbell = true
vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 0
vim.opt.autowrite = true
vim.opt.cursorline = true
--vim.opt.cursorcolumn = true
vim.opt.grepformat = "%f:%l:%c:%m" 
vim.opt.foldlevel = 99
vim.opt.undofile = true
vim.opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
vim.opt.autoread = true
vim.opt.wildmode = "longest:full,full"
vim.opt.wildoptions = "pum"
vim.opt.ruler = true
vim.opt.syntax = "on"
vim.opt.mouse = "a"
vim.opt.spell = true
vim.opt.showtabline = 2
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = 'menuone,noselect,noinsert,popup'
vim.opt.clipboard:append("unnamedplus") 
--vim.opt.spelllang = 'en_us,pt_br' -- Inglês e Português

-- Folder config
vim.opt.foldlevel = 99
vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
if vim.fn.has("nvim-0.10") == 1 then
  vim.opt.smoothscroll = true
--  vim.opt.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"
  vim.opt.foldmethod = "expr"
  vim.opt.foldtext = ""
else
  vim.opt.foldmethod = "indent"
--  vim.opt.foldtext = "v:lua.require'lazyvim.util'.ui.foldtext()"
end

-- use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

--Line numbers
vim.wo.number = true

-- Nvim Transparent
vim.g.transparent_enabled = true

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })

-- Nvim tree highlight
vim.cmd([[
    :hi      NvimTreeExecFile    guifg=#ffa0a0
    :hi      NvimTreeSpecialFile guifg=#ff80ff gui=underline
    :hi      NvimTreeSymlink     guifg=Yellow  gui=italic
    :hi link NvimTreeImageFile   Title
]])


