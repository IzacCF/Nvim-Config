 require('lualine').setup {
   options = {
     icons_enabled = true,
     theme = 'auto',
--   theme = 'nightfly',
--   theme = 'gruvbox',
--   theme = 'catppuccin',
--   theme = 'tokyodark',
--   theme = 'powerline_dark',
--   theme = 'solarized',
   },
   sections = {
     lualine_a = {
       {
         'filename',
         path = 1,
       }
     }
   }
 }
-- 

