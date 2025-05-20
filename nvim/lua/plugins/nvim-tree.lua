return {
	"nvim-tree/nvim-tree.lua",

	init = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		-- optionally enable 24-bit colour
		vim.opt.termguicolors = true
	end,

	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	opts = {
		view = {
			width = 60,
		},
		actions = {
			open_file = {
				quit_on_open = true,
			}
		},
		filters = {
			git_ignored = false,
			dotfiles = true,
		}
	},

	keys = {
		{'<M-0>', '<cmd>NvimTreeFindFileToggle<cr>', mode = {'n', 'i'}},
	}
}
