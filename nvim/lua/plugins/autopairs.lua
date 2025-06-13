return {
  'windwp/nvim-autopairs',
  event = "InsertEnter", -- Carga perezosa al entrar en modo insertar
  opts = {               -- Opciones por defecto (puedes añadir las tuyas)
    check_ts = true,     -- Asegura compatibilidad con Tree-sitter (si lo usas)
    ts_config = {
      lua = { "string", "comment" },
      javascript = { "string", "comment", "jsx" },
      typescript = { "string", "comment", "tsx" },
      html = { "string", "comment" },
      css = { "string", "comment" },
      -- Añade otros lenguajes según necesites
    },
    fast_wrap = {},      -- Para atajos rápidos de envolver (opcional, si quieres usarlo)
    disable_filetype = { "TelescopePrompt", "vim", "markdown" }, -- Deshabilita en estos tipos de archivo
  },
}
