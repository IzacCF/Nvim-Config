----------   Global maps   ----------

-- Mapeamentos exclusivos para <LEADER>=SPACE
-- LAZY
vim.api.nvim_set_keymap('n', '<leader>l', ':Lazy<CR>', { noremap = true, silent = true })
 
-- Salvar e sair
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })

-- Space+/ para entrar em modo comando
vim.api.nvim_set_keymap('n', '<leader>/', ':', { noremap = true, silent = false })

-- Split Horinzontal
vim.api.nvim_set_keymap('n', '<leader>s', ':new<CR>', { noremap = true, silent = true })

-- Decobrir colorscheme em uso:
vim.api.nvim_set_keymap('n', '<leader>n', ':echo g:colors_name<CR>', { noremap = true, silent = true })

-- Limpar o Clipboard
vim.api.nvim_set_keymap('n', '<leader>c', ':let @+ = \'\' | echo "Clipboard cleared!"<CR>', { noremap = true, silent = true })
-- Clean Search - Limpa a busca
vim.api.nvim_set_keymap("n", "<leader>h", ":let @/=''<CR>", { noremap = true, silent = true })

-- Mapeamento para DESTACAR ESPAÇOS em branco no final das linhas
vim.api.nvim_set_keymap('n', '<leader>+', [[:match ErrorMsg '\s\+$'<CR>]], { noremap = true, silent = true })
-- Mapeamento para REMOVER DESTAQUES	de espaços em branco
vim.api.nvim_set_keymap('n', '<leader>b', [[:match none<CR>]], { noremap = true, silent = true })

-- Mapeamento para REMOVER A LINHA atual (modo normal)
vim.api.nvim_set_keymap('n', '<leader>d', 'dd', { noremap = true, silent = true })

-- Mover Cursor para 1° linha do texto
vim.api.nvim_set_keymap('n', '<leader>0', 'gg0', { noremap= true, silent = true })
-- Mover Cursor para última linha do texto
vim.api.nvim_set_keymap('n', '<leader>g', 'G', { noremap= true, silent = true })

-- AutoSave Toggle
vim.api.nvim_set_keymap("n", "<leader>a", ":ASToggle<CR>", {noremap = true, silent = true})

-- Formatter Plugin
vim.api.nvim_set_keymap('n', '<leader>f', ':Format<CR>', { noremap = true, silent = true })




---     Teclas de Função   ---

-- Help Toggle
function ToggleHelp()
  if vim.bo.filetype == 'help' then
    vim.cmd('quit')
  else
    vim.cmd('help')
  end
end
vim.api.nvim_set_keymap('n', '<F1>', ':lua ToggleHelp()<CR>', { noremap = true, silent = true })

-- Retornar ao Alpha - F2
vim.api.nvim_set_keymap("n", "<F2>", ":Alpha<CR>", { noremap = true, silent = true })

--  Emmet Vim - F3
vim.cmd([[
let g:user_emmet_mode='n'
let g:user_emmet_mode='inv'
let g:user_emmet_mode='a'
let g:user_emmet_install_global = 0
autocmd FileType html,liquid,css,python,java EmmetInstall
let g:user_emmet_leader_key='<F3>'
]])
vim.g.user_emmet_expandabbr_key = "<F3>"
vim.g.user_emmet_leader_key = "<F3>"

-- Commenter - F4
vim.api.nvim_set_keymap('n', '<F4>g', 'gcc', { noremap = false, silent = true }) -- Normal
vim.api.nvim_set_keymap('v', '<F4>v', 'gc', { noremap = false, silent = true }) -- Visual

-- Python CMD - <F5>p
vim.api.nvim_set_keymap("n", "<F5>p", ":botright 20sp term://python3 %<CR>", { noremap = true, silent = true })
vim.cmd([[autocmd TermOpen * startinsert]])
-- Java CMD - <F5>j
vim.api.nvim_set_keymap("n", "<F5>j", ":vsplit | wincmd l | term java %<CR>", { noremap = true, silent = true })
-- HTML Browser - <F5>h
vim.api.nvim_set_keymap('n', '<F5>h', [[:!xdg-open %<CR>]], { noremap = true, silent = true })

-- ToggleTerm - F6
vim.api.nvim_set_keymap("n", "<F6>", "<CMD>ToggleTerm<CR>", { noremap = true, silent = true })

-- NeoTree - F7
vim.api.nvim_set_keymap("n", "<F7>", "<CMD>nvim-treetoggle<CR>", { noremap = true, silent = true })

-- F8
vim.api.nvim_set_keymap('n', '<F8>', ':Twilight<CR>', { noremap = true, silent = true })

-- Função Replace - F9
vim.keymap.set(
	{ "n", "x" },
	"<F9>",
	function() require("rip-substitute").sub() end,
	{ desc = " rip substitute" }
)

-- Telescope - F10
vim.api.nvim_set_keymap('n', '<F10>t', ':Telescope find_files<CR>', { noremap = true, silent = true })
-- TelesCope Recent File
vim.api.nvim_set_keymap("n", "<F10>r", [[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]], {noremap = true, silent = true})
-- Telescope Keymaps
vim.api.nvim_set_keymap('n', '<F10>k', ':Telescope keymaps<CR>', { noremap = true, silent = true })
-- UndoTree
vim.api.nvim_set_keymap("n", "<F10>u", ":UndotreeToggle<CR>", { noremap = true, silent = true })
-- Oil Plugin
vim.keymap.set("n", "<F10>o", "<CMD>Oil<CR>", { desc = "Open parent directory" })
-- OutLine Plugin
-- <F10>l -- Pre-Configured in plugin

-- Função para alternar diagnósticos - <F11>
local diagnostics_active = true
function _G.toggle_diagnostics()
  diagnostics_active = not diagnostics_active
  if diagnostics_active then
    vim.diagnostic.enable()
    print("LSP diagnostics enabled")
  else
    vim.diagnostic.disable()
    print("LSP diagnostics disabled")
  end
end
vim.api.nvim_set_keymap('n', '<F11>', ':lua toggle_diagnostics()<CR>', { noremap = true, silent = true })

-- F12 - Nvim



--     Splits    --
--Dividir a tela verticalmente
vim.keymap.set("n", "<S-Up>", ":vnew <CR>", { noremap = true, silent = true })
--Fecha a divisão de janelas
vim.keymap.set("n", "<S-Down>", ":only<CR>", { noremap = true, silent = true })
--Navegue entre as telas divididas
vim.keymap.set("n", "<S-Right>", "<C-w>l", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Left>", "<C-w>h", { noremap = true, silent = true })

-- Split resize - Ajustar o tamanho dos Splits com Alt + setas
vim.api.nvim_set_keymap("n", "<A-Up>", ":resize -2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-Down>", ":resize +2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-Left>", ":vertical resize -2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-Right>", ":vertical resize +2<CR>", { noremap = true, silent = true })

--   Buffers/Tab --
-- Criar um novo buffer (Ctrl + Up)
vim.api.nvim_set_keymap("n", "<C-Up>", ":tabnew<CR>", { noremap = true, silent = true })
-- Navegar para o próximo buffer (Ctrl + Right)
vim.api.nvim_set_keymap("n", "<C-Right>", ":bnext<CR>", { noremap = true, silent = true })
-- Navegar para o buffer anterior (Ctrl + Left)
vim.api.nvim_set_keymap("n", "<C-Left>", ":bprevious<CR>", { noremap = true, silent = true })
-- Fechar o buffer atual (Ctrl + Down)
vim.api.nvim_set_keymap("n", "<C-Down>", ":bd<CR>", { noremap = true, silent = true })
--


--    Copiar, colar, selecionar, cortar e salvar   --
-- <C-v> para colar no modo normal e insert
vim.api.nvim_set_keymap("n", "<C-p>", '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-p>", '"+p', { noremap = true, silent = true })

-- <C-a> para selecionar tudo no modo normal e insert
vim.api.nvim_set_keymap("n", "<C-a>", "ggVG", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-a>", "ggVG", { noremap = true, silent = true })

-- <C-c> para copiar no modo visual e normal
vim.api.nvim_set_keymap("v", "<C-c>", '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-c>", '"+y', { noremap = true, silent = true })

-- <C-x> para cortar no modo visual
vim.api.nvim_set_keymap("v", "<C-x>", '"+d', { noremap = true, silent = true })

-- <C-s> para salvar o arquivo atual
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-s>", ":w<CR>", { noremap = true, silent = true })
--





