vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.md",
  callback = function()
    vim.opt.wrap = true      -- Habilita el ajuste de línea
    --vim.opt.linebreak = true -- Evita cortes de palabras
    vim.opt.textwidth = 80   -- Define un ancho de texto recomendado

		--print('estas en markdown')
		vim.opt.nu = false
		vim.opt.rnu = false
		--vim.opt.numberwidth = 0
		--vim.opt.updatetime = 300
  end
})

