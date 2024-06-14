require("nvim-tree").setup({
	view = {
		width = 60,
	},
	actions = {
		open_file = {
			quit_on_open = true
		}
	},
	filters = {
		git_ignored = false
	}
})

vim.keymap.set({'n', 'i'}, '<M-0>', '<Cmd>NvimTreeFindFileToggle<CR>')
