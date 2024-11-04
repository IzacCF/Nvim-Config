require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 40,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
--  dotfiles = false, -- exibe arquivos ocultos
  },
})

vim.keymap.set('n', '<F7>', ':NvimTreeToggle<CR>')
