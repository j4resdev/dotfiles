return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "vim", "bash", "dart", "markdown" }, -- Agrega lenguajes según necesidad
      highlight = { enable = true }, -- Activa el resaltado de sintaxis
      indent = { enable = true }, -- Indentación basada en el árbol sintáctico
    })
  end
}

