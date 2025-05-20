vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use {'wbthomason/packer.nvim'}

	use {'Asheq/close-buffers.vim'}
	use {'jremmen/vim-ripgrep'}
	use {'mbbill/undotree'}
	use {'numToStr/Comment.nvim', config = function() require('Comment').setup() end }
	use {'nvim-tree/nvim-tree.lua'}
	use {'nvim-tree/nvim-web-devicons'}
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use {'puremourning/vimspector'}
	use {'tpope/vim-dispatch'}
	use {'tpope/vim-fugitive'}
	use {'tpope/vim-sleuth'}
	use {'tpope/vim-surround'}

	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			{'nvim-lua/plenary.nvim'}
		}
	}
	use {
		'nvim-telescope/telescope-fzf-native.nvim',
		run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
	}
end)
