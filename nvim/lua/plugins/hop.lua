return {
  'phaazon/hop.nvim',
  branch = 'v2', -- Asegúrate de usar la rama v2 para la última versión
  event = "InsertEnter", -- Carga perezosa al entrar en modo insertar
  keys = {
    { 't', function() require('hop').hint_char1() end, desc = 'Hop: Buscar caracter en pantalla' },
  },
  opts = {
  	keys = 'aoeuidhtnspyfgcrl',
  	quit_key = '<SPC>',
  	case_insensitive = false,
  },
  config = function()
  	require('hop').setup({}) -- Llama al setup primero
  	vim.cmd('highlight HopNextKey guifg=#FF0000') -- Color para la primera tecla
  	vim.cmd('highlight HopNextKey1 guifg=#D97B19') -- Color para la segunda tecla
  	vim.cmd('highlight HopNextKey2 guifg=#FF0000') -- Color para la tercera tecla
	end,
}
