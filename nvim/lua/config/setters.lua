local o = vim.opt

o.rnu = true
o.nu = true
o.numberwidth = 2
o.updatetime = 300

o.confirm = true
o.scrolloff = 3

o.hlsearch = true
o.ignorecase = true
o.smartcase = true

o.laststatus = 3
o.cmdheight = 0

o.clipboard = "unnamedplus"
o.cursorline = true


o.autoread = true
o.backup = false
o.writebackup = false
o.undofile = true
o.undodir = vim.fn.stdpath('cache') .. '/nvim/undo//'
--o.swapfile = true
--o.dir = vim.fn.stdpath('cache') .. '/nvim/swap//'

-- Indentation
o.expandtab = false
o.tabstop = 2
o.shiftwidth = 2
o.smartindent = true
o.softtabstop = 2
o.breakindent = true
o.copyindent = true
o.preserveindent = true

o.mouse = "a"
o.list = false
o.fillchars = {
	eob				= " ",
	--fold			= " ",
	--foldopen	= '┌',
	--foldclose = ''
}

-- En tu init.lua
o.foldenable = false

o.ruler = false
o.wrap = false

o.showmode = false
o.shortmess:append "sI"
o.foldcolumn = "0"
o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.termguicolors = true
o.timeoutlen = 400

-- ~/.local/share/nvim/site/spell/es.utf-8.add
o.spell = false
o.spelllang = { "es", "en_us" }

-- revision
o.conceallevel = 0
