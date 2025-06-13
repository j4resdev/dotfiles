return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "williamboman/mason.nvim",
      cmd = "Mason",
      build = ":MasonUpdate",
      config = function()
        require("mason").setup({
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗"
            }
          }
        })
      end
    },

    {
      "williamboman/mason-lspconfig.nvim",
      config = function()
        --require("mason-lspconfig").setup({
        --  ensure_installed = {"lua_ls", "rust_analyzer" }, -- Agrega los servidores que necesitas
       	-- })
      end
    },
  },
	config = function ()
		local lspconfig = require("lspconfig")

		-- Configuración básica para LSP
    local on_attach = function(_, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }

      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "gl", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)

			vim.keymap.set("n", "<leader>fl", vim.lsp.buf.document_symbol, opts)   --listar
			vim.keymap.set("n", "<leader>fL", vim.lsp.buf.workspace_symbol, opts)

      vim.keymap.set("n", "<leader>u", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "<leader>e", vim.lsp.buf.signature_help, opts)
      vim.keymap.set("n", "<leader>a", vim.lsp.buf.rename, opts)
			-- Diagnostic
			vim.keymap.set("n", "<leader>o", vim.diagnostic.open_float, opts)
			vim.keymap.set("n", "<s-tab>", vim.diagnostic.goto_prev, opts)
			vim.keymap.set("n", "<tab>", vim.diagnostic.goto_next, opts)
			vim.keymap.set("n", "<leader><tab>", vim.diagnostic.setloclist, { noremap = true, silent = true })


			-- acciones sobre el buffer
      vim.keymap.set("n", "<leader>fa", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "<leader>ft", vim.lsp.buf.format, opts)
    end


		-- Configurar el servidor de Lua
    lspconfig.lua_ls.setup({
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
        },
      },
    })



		vim.diagnostic.config({
  		signs = true,      -- Activa signos en la columna lateral izquierda
  		virtual_text = {
    		spacing = 2,
    		align = "right" -- Muestra los errores alineados al lado derecho
  		},
  		underline = true,  -- Mantiene el subrayado en el código
		})

	end
}

