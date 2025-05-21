vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.wrap = false

vim.opt.number = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.list = true
vim.opt.listchars = {
	tab = ". ",
	nbsp = "~",
	--trail = "_",
	extends = ">",
	precedes = "<",
	--eol = '↵',
}

vim.opt.statusline = '%F %h%w%m%r %=%(%l,%c%V %= %P%)'

vim.g.dispatch_handlers = { 'job' }
