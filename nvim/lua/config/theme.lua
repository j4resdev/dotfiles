vim.api.nvim_create_user_command('Theme', ':vs ~/.config/nvim/lua/config/theme.lua' , {})
local h = vim.api.nvim_set_hl

local function coloracion(font, grupo )
	local vfg = font[1]
	local estilos = { vbg = 'none', i = false, b = false, u = false, s = false }

	if type(font) == 'string' then
		vfg = font
	else
		for i, dato in ipairs(font) do
      if estilos[dato] ~= nil then
        estilos[dato] = true
      end
      if i == 2 and #dato ~= 1 then
        estilos.vbg = dato
      end
    end
	end
	h(0, grupo, { fg = vfg, bg = estilos.vbg, italic = estilos.i, bold = estilos.b, underline = estilos.u, strikethrough = estilos.s, nocombine = true })
end

local function f(font, ...)
	local grupos = { ... }

	for _, valor in ipairs(grupos) do
		if type(valor) == 'table' then   -- si es una tabla
			for i, valorTabla in ipairs(valor) do
				if i ~= 1 then
					local grupo = '@'.. valor[1] .. '.' .. valorTabla
					coloracion(font, grupo)
				end
			end
		else
			coloracion(font, valor)
		end
	end
end
----------------------------------------------------------------
local PanelActivo			= {'none','#000000'}
local PanelInactivo		= PanelActivo
local CursorLineal		= {'none','none'}
local CursorNumeral		= 'orange'
local seleccionVisual = {'#9C9C9C', '#333334'}
local BarraDeEstado					= {'#FFA41A','#000000','i'}
local BarraPestanas					= {'#4E3C0D','i'}
local BarraPestanasSel			= {'orange','i'}
local BarraPestanasNumerica = 'none'
local SeparadorDePanel	= {'#0E0E0E', 'none'}
local ColumnaNumerica		= '#3F3F3F'
local MenuBase				= {'#9D9C9C', '#2E2E2E'}
local MenuSel					= {'#FFFFFF', '#282828'}
local MenuColumna			= {'blue', 'blue'}
local MenuColumnaSel	= {'pink', 'blue'}
--
f(PanelActivo			, 'Normal')
f(PanelInactivo		, 'NormalNC')
f(CursorLineal		, 'CursorLine')
f(CursorNumeral		, 'CursorLineNr')
f(seleccionVisual	, 'Visual')
f(BarraPestanasNumerica	, 'Title')
f(BarraPestanasSel			, 'TabLineSel')
f(BarraPestanas					, 'TabLine')
f(BarraDeEstado					, 'StatusLine')
f(SeparadorDePanel	, 'WinSeparator')
f(ColumnaNumerica		, 'LineNr')
f(MenuBase				, 'Pmenu')
f(MenuSel					, 'PmenuSel')
f(MenuColumna			, 'PmenuSbar')
f(MenuColumnaSel	, 'PmenuThumb')
----------------------------------------------------------------
-- esto es un comentario 
local comentarios		= {'#3F3F3F','i'}
local cadenas	= '#4FF672'
local numeros	= '#FFC300'
local boleanos = '#FF6700'
--local nulos		= {'#FF0000', 'i','u'}
--local constructores		= '#FF8300'
local variables		= {'#EAEAEA'}

local palabraReservada = '#FF4B47'

local metodos		= '#9D76BF'
local funcion		= metodos
local condicional = '#3148F6'
local ciclos = '#3148F6'

local operador		= '#D77349'
local tiposDeClases		= {'#E09B39','i'}
local signoPuntuacion		= metodos
local signoParentesis		= metodos
local puntuacionEspecial = '#DCDA56'
local claseDeclaracion = '#5C8ABD'

local clasesFlutter = '#00FFFF'
local propiedades = '#30979D'
-----------------
f(comentarios,'Comment')
f(cadenas, 'String')
f(numeros, 'Number')
f(boleanos, 'Boolean')

f(variables,{'lsp.type.variable','dart'}, {'lsp.type.property','dart'})

f(palabraReservada, {'lsp.type.keyword','dart'},{'keyword','lua'})

f(metodos,{'lsp.type.method','dart','lua'})
f(funcion,{'lsp.type.function','dart'},{'keyword.function','lua'})
f(condicional, {'lsp.mod.control','dart'},{'keyword.return','lua'},{'keyword.conditional','lua'})
f(ciclos, {'keyword.repeat','lua'})

f(operador, 'Operator',{'keyword.operator','lua'})
f(tiposDeClases,{'lsp.type.class','dart'})
f(signoPuntuacion,{'punctuation.delimiter','dart'})
f(signoParentesis,{'punctuation.bracket','dart','lua'})
f(puntuacionEspecial, {'punctuation.special','dart'})
f(claseDeclaracion, {'lsp.typemod.class.declaration','dart'})

f(clasesFlutter,{'lsp.mod.constructor','dart'})
f(propiedades,{'lsp.type.parameter','dart'})

----------------------------------------- markdown
local listas = '#FFC700'
local casillaDesmarcada = '#8A2F2F'
local casillaMarcada = '#37B922'
local linea = '#FF0000'
local encabezado = '#5D4DEB'

f(listas, {'markup.list','markdown'})
f(casillaDesmarcada, {'markup.list.unchecked','markdown'})
f(casillaMarcada, {'markup.list.checked','markdown'})
f(linea, {'punctuation.special','markdown'})
f(encabezado, {'markup.heading.1','markdown'})
f(encabezado, {'markup.heading.2','markdown'})
f(encabezado, {'markup.heading.3','markdown'})
f(encabezado, {'markup.heading.4','markdown'})
f(encabezado, {'markup.heading.5','markdown'})
f(encabezado, {'markup.heading.6','markdown'})



