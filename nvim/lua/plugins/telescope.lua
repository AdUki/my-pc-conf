return {
	'nvim-telescope/telescope.nvim',

	tag = "0.1.8",

	dependencies = {
		'nvim-lua/plenary.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' },
	},

	config = function()
		local actions = require("telescope.actions")
		local builtin = require('telescope.builtin')

		require('telescope').setup({
			defaults = {
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						['<C-d>'] = actions.delete_buffer,
						["<Esc>"] = actions.close,
					}
				}
			},
			extensions = {
				fzf = {
					fuzzy = true,                    -- false will only do exact matching
					override_generic_sorter = true,  -- override the generic sorter
					override_file_sorter = true,     -- override the file sorter
					case_mode = "smart_case",        -- or "ignore_case" or "respect_case", the default case_mode is "smart_case"
				}
			}
		})

		require('telescope').load_extension('fzf')

		vim.keymap.set('n', '<Leader>tt', builtin.find_files, {})
		vim.keymap.set('n', '<Leader>tb', builtin.buffers, {})
		vim.keymap.set('n', '<Leader>tg', builtin.live_grep, {})
		vim.keymap.set('n', '<Leader>th', builtin.help_tags, {})
	end
}
