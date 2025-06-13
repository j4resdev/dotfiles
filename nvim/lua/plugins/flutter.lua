return {
	{
		"dart-lang/dart-vim-plugin",
		ft = "dart",
		init = function()
			-- Configuración específica para dart-vim-plugin
			vim.g.dart_style_guide = 2
			vim.g.dart_format_on_save = 1
		end
	},
  {
    "akinsho/flutter-tools.nvim",
    ft = "dart",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- Opcional pero recomendado para UI
    },
    config = function()
      require("flutter-tools").setup({
        widget_guides = {
          enabled = true,
        },
        closing_tags = {
          highlight = "ErrorMsg",
          prefix = "// ",
          enabled = true
        },
        dev_log = {
          enabled = true,
          open_cmd = "tabedit", -- Comando para abrir el log
        },
        outline = {
          open_cmd = "30vnew", -- Comando para abrir el outline
          auto_open = false
        },
        lsp = {
          color = {
            enabled = true,
            background = false,
            background_color = nil,
            foreground = false,
            virtual_text = true,
            virtual_text_str = "■",
          },
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
            analysisExcludedFolders = {},
            renameFilesWithClasses = "prompt",
            enableSnippets = true,
          },
        }
      })
    end,
  },
}
