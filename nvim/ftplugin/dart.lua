local opts = { noremap = true, silent = true}

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






