local m = function(mode, key, result)
  vim.api.nvim_set_keymap(mode, key, result, {noremap = true, silent = true})
end

vim.g.mapleader = ' '
m('i','ii','<esc>')
m('n',',,',':w<cr>:so%<cr>')
-- -------------------------------- ir a archivos
m('i','~n','ñ')
m('i','~a','á')
m('i','~e','é')
m('i','~i','í')
m('i','~o','ó')
m('i','~u','ú')
-- -------------------------------- ir a archivos
--m('n','mpc',':e ~/.config/nvim/lua/config/mpc.lua<cr>')
--m('n','mpt',':e ~/.config/nvim/lua/config/setters.lua<cr>')
--m('n','mpp',':e ~/Documents/borrar.txt<cr>')
-- -------------------------------- busqueda
m('n','n','nzzzv')
m('n','N','Nzzzv')
m('n','<leader>n',':noh<cr>')
m('n','*','*N')
--m('n','>','>>')
--m('n','<','<<')
-- -------------------------------- selección
m('n','mv','BvE')
m('n','mV','ggVG')
-- -------------------------------- pagina
m('n','<s-j>','<c-f>')
m('n','<s-k>','<c-b>')
-- -------------------------------- buffers
m('n','<leader>w',':w<cr>')
m('n','<leader>q',':q<cr>')
m('n',',.',':e#<cr>')
m('n',',o',':only<cr>')
-- -------------------------------- paneles
m('n','<leader>l','<c-w>l')
m('n','<leader>h','<c-w>h')
m('n','<leader>j','<c-w>j')
m('n','<leader>k','<c-w>k')
-- -------------------------------- pestañas
m('n',',O',':tabonly<cr>')
m('n',',l',':tabnext<cr>')
m('n',',h',':tabprevious<cr>')
-- -------------------------------- Mover
--m("v","<s-j>",":m '>+1<CR>gv=gv")
--m("v","<s-k>",":m '<-2<CR>gv=gv")
m("n","<DOWN>",":m .+1<CR>")
m("n","<UP>",":m .-2<CR>")
-- -------------------------------- abreviaciones
vim.cmd([[ iabbrev abreviacion muy buenos dias ]])
-- -------------------------------- sin clasificar

--m('n',',,',':w<cr>:so%<cr>')																-- para probar
m('n','<F3>',':w<cr>')
m('n','<c-l>',':Inspect<cr>')


-- dos 
-- uno
-- tres


-- cuatro
-- cinco


m('n','<leader>fn',':e /mnt/windows/Projects/Documents/Obsidian/Programming/Init.md<cr>')


--m("n","<c-l>",":Inspect<cr>")
--m("n","<c-s>",":echo synIDattr(synID(line('.'), col('.'), 1), 'name')<cr>")
--vim.api.nvim_set_keymap('n', '<C-s>', ':let @+=execute(":echo synIDattr(synID(line(\'.\'), col(\'.\'), 1), \\\'name\\\')")<cr>', { noremap = true, silent = true })


--m('n','<leader>w',':w<cr>:so%<cr>:!lua ~/.config/nvim/lua/config/ejemplo.lua<cr>')
--m('n','<F3>',':!lua ~/.config/nvim/lua/config/ejemplo.lua<cr>')
