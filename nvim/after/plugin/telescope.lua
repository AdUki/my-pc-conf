local actions = require("telescope.actions")

require('telescope').setup{
	defaults = {
		-- Default configuration for telescope goes here:
		-- config_key = value,
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				['<C-d>'] = actions.delete_buffer,
				["<Esc>"] = actions.close,
			}
		}
	},
	pickers = {
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
	},
	extensions = {
		-- Your extension configuration goes here:
		-- extension_name = {
		--   extension_config_key = value,
		-- }
		-- please take a look at the readme of the extension you want to configure
	}
}

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<Leader>tt', builtin.find_files, {})
vim.keymap.set('n', '<Leader>tb', builtin.buffers, {})
vim.keymap.set('n', '<Leader>tg', builtin.live_grep, {})
vim.keymap.set('n', '<Leader>th', builtin.help_tags, {})

require'nvim-web-devicons'.setup{}
