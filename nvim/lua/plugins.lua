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
	use {'rose-pine/neovim', as = 'rose-pine'}
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

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			{'L3MON4D3/LuaSnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/nvim-cmp'},
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason-lspconfig.nvim'},
			{'williamboman/mason.nvim'},
		}
	}
end)
