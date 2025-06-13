return	{
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make'
		}
	},
	config = function(_, opts)
		local telescope = require('telescope')
    telescope.setup(opts)

    -- Cargar extensiones
    telescope.load_extension('fzf')
    telescope.load_extension('file_browser')

		local fondo = '#0D0D0D'
		local h = vim.api.nvim_set_hl
		h(0, "TelescopeNormal", { bg = fondo, fg = "#cdd6f4" })  -- Fondo y texto
		h(0, "TelescopeBorder", { bg = fondo, fg = "#89b4fa" })  -- Borde
		h(0, "TelescopePromptNormal", { bg = fondo, fg = "#f5e0dc" })  -- Barra de búsqueda
		h(0, "TelescopeSelection", { bg = fondo, fg = "#f5e0dc" })  -- Elemento seleccionado

    -- Configuración adicional que no va en opts
    telescope.setup {
      pickers = {
        buffers = {
          sort_lastused = true,
          ignore_current_buffer = true,
        }
      },
      extensions = {
        file_browser = {
          theme = "dropdown",
          hijack_netrw = true,  -- Reemplazar netrw
          hidden = true,        -- Mostrar archivos ocultos
          respect_gitignore = false, -- Opcional
        },
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        }
      }
    }
	end,

	opts = {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = {
        prompt_position = "top", -- def:top
        width = 0.80,
        height = 0.80,
        preview_width = 0.55,
      },
      sorting_strategy = "ascending",
      winblend = 0,
      border = true,
      --borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
      borderchars = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
      color_devicons = true,
      file_ignore_patterns = { "node_modules", ".git/" },
      path_display = { "truncate" }, --truncate
			--	mappings = {
			--	i = {
			--		["<C-j>"] = require("telescope.actions").move_selection_next,
			--		["<C-k>"] = require("telescope.actions").move_selection_previous,
			--		["<esc>"] = require("telescope.actions").close,
			--	},
			--},
    },
  },

  keys = {
 		-- Buscar archivos (incluyendo hidden)
    { ";f", function() require('telescope.builtin').find_files() end, silent = true, desc = "Find Files (including hidden)" },

		{ ";b", function() require("telescope.builtin").buffers() end, desc = "Search Buffers" },
 		-- File browser mejorado
    { "<leader>no", function()
      require("telescope").extensions.file_browser.file_browser({
        path = "%:h:p",
        select_buffer = true,
        grouped = true,
        initial_mode = "normal",
      })
    end,
      desc = "File Browser"
    },
		-- Buscar en configuración de nvim
    {
      ";n",
      function()
        require("telescope.builtin").find_files({
          prompt_title = "NVIM Config",
          cwd = vim.fn.stdpath("config"),
          hidden = true,
          layout_config = {
            width = 0.8,
            height = 0.8
          },
          attach_mappings = function(_, map)
            local actions = require("telescope.actions")
            local action_state = require("telescope.actions.state")

            -- Crear nuevo plugin si no existe
            map("i", "<c-y>", function(prompt_bufnr)
              local new_plugin = action_state.get_current_line()
              actions.close(prompt_bufnr)

              -- Validar nombre del plugin
              if new_plugin:match("^[%w-_]+$") then
                vim.cmd(string.format("edit ~/.config/nvim/lua/plugins/%s.lua", new_plugin))
              else
                vim.notify("Invalid plugin name. Use only letters, numbers, - and _", vim.log.levels.WARN)
              end
            end)

            return true
          end
        })
      end,
      desc = "Search NVIM Config"
    },

    -- Atajos adicionales recomendados
    {
      ";g",
      function()
        require('telescope.builtin').live_grep()
      end,
      desc = "Live Grep"
    },
    {
      ";h",
      function()
        require('telescope.builtin').help_tags()
      end,
      desc = "Help Tags"
    },
    {
      ";r",
      function()
        require('telescope.builtin').oldfiles()
      end,
      desc = "Recent Files"
    },
		-- Buscar en configuración de nvim
    {
      ";,",
      function()
        require("telescope.builtin").find_files({
          prompt_title = "NVIM Config",
          cwd = vim.fn.stdpath("config"),
          hidden = true,
          layout_config = {
            width = 0.8,
            height = 0.8
          },
          attach_mappings = function(_, map)
            local actions = require("telescope.actions")
            local action_state = require("telescope.actions.state")

            -- Crear nuevo plugin si no existe
            map("i", "<c-y>", function(prompt_bufnr)
              local new_plugin = action_state.get_current_line()
              actions.close(prompt_bufnr)

              -- Validar nombre del plugin
              if new_plugin:match("^[%w-_]+$") then
                vim.cmd(string.format("edit ~/.config/nvim/lua/plugins/%s.lua", new_plugin))
              else
                vim.notify("Invalid plugin name. Use only letters, numbers, - and _", vim.log.levels.WARN)
              end
            end)

            return true
          end
        })
      end,
      desc = "Search NVIM Config"
    },

    -- Atajos adicionales recomendados
    {
      ";g",
      function()
        require('telescope.builtin').live_grep()
      end,
      desc = "Live Grep"
    },
    {
      ";h",
      function()
        require('telescope.builtin').help_tags()
      end,
      desc = "Help Tags"
    },
    {
      ";r",
      function()
        require('telescope.builtin').oldfiles()
      end,
      desc = "Recent Files"
    }
  }
}
