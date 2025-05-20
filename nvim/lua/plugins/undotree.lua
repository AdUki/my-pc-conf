
return {
	"mbbill/undotree",

	init = function()
		vim.opt.swapfile = false
		vim.opt.backup = false
		vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
		vim.opt.undofile = true
	end,

	keys = {
		{'<Leader>u', vim.cmd.UndotreeToggle},
	}
}
