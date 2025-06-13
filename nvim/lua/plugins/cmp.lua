return {
  "hrsh7th/nvim-cmp",
  --event = "InsertEnter",
	event = 'VeryLazy',
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- Completado del LSP
    "hrsh7th/cmp-buffer",   -- Completado del buffer actual
    "hrsh7th/cmp-path",     -- Completado de rutas de archivos
		'hrsh7th/cmp-cmdline',	-- Completado del cmdline
		'SirVer/ultisnips',
  },
  config = function()
  	local cmp = require('cmp')
		local cmp_autopairs = require('nvim-autopairs.completion.cmp')

  	cmp.setup({
  		--experimental = {
		--		ghost_text = true -- muestra una vista previa de la sugerencia
  	--	},


  		completion = {
  			keyword_length = 2,				-- mostrar sugerencias desde 2 caracteres
  		},
			performance = {
				debounce = 50,						-- reduce el retraso antes de mostrar sugerencias
				throttle = 30,						-- limita la frecuencia de actualizacion
				fetching_timeout = 100,		-- tiempo maximo para obtener completado
			},

			snippet = {
    		expand = function(args)
      		vim.fn["UltiSnips#Anon"](args.body) -- Usa UltiSnips para expandir snippets
    		end,
  		},

  		mapping = {
    		-- Scroll en documentación
    		--['<C-b>'] = cmp.mapping.scroll_docs(-4),     -- Scroll up
    		--['<C-f>'] = cmp.mapping.scroll_docs(4),      -- Scroll down

				-- confirmar seleccion
    		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Enter confirma

				-- Abrir/cerrar autocompletado
				['<C-Space>'] = cmp.mapping(function()
      		if cmp.visible() then
        		cmp.abort()
      		else
        		cmp.complete()
      		end
    		end, { 'i', 's' }),

				-- Mapeos clave para Ultisnips(importantes)
				['<Tab>'] = cmp.mapping(function()
      		if cmp.visible() then
        		cmp.select_next_item()
      		else
 						vim.api.nvim_feedkeys(
          		vim.api.nvim_replace_termcodes('\t', true, true, true),
          		'n',
          		true
        		)
      		end
    		end, { 'i', 's' }),

				-- Mapeos clave para Ultisnips(importantes)
				['<s-Tab>'] = cmp.mapping(function(fallback)
      		if cmp.visible() then
        		cmp.select_prev_item()
      		else
        		-- Un-tab (elimina sangría)
        		local line = vim.api.nvim_get_current_line()
        		local col = vim.api.nvim_win_get_cursor(0)[2] + 1
        		if line:sub(col - 1, col - 1) == '\t' then
          		-- Elimina un tab literal
          		vim.api.nvim_feedkeys(
            		vim.api.nvim_replace_termcodes('\b', true, true, true), -- Backspace
            		'n',
            		true
          		)
        		else
          		-- Intenta eliminar espacios según shiftwidth
          		local shiftwidth = vim.fn.shiftwidth()
          		if line:sub(col - shiftwidth, col - 1):match('^%s+$') then
            		vim.api.nvim_feedkeys(
              		vim.api.nvim_replace_termcodes(string.rep('\b', shiftwidth), true, true, true),
              		'n',
              		true
            		)
          		else
            		fallback() -- Comportamiento por defecto si no hay sangría
          		end
        		end
      		end
    		end, { 'i', 's' }),
  		},

			-- fuentes
  		sources = cmp.config.sources({
    		--{ name = 'ultisnips' },
    		{ name = 'nvim_lsp' },
    		{ name = 'buffer', keyword_length = 4 },			-- buffer solo para palabras largas
    		{ name = 'path' },
  		}),
		})

		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { text = "" } })

		cmp.setup.cmdline({ '/', '?' }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = 'buffer' }
			}
		})

		cmp.setup.cmdline(':', {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = 'path' }
			},{
					{ name = 'cmdline' }
				}),
		})

	end
}
