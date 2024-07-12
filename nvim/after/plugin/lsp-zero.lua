local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(_, bufnr)
	lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {
		'lua_ls',
		'clangd'
	},
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end,
	}
})

vim.api.nvim_create_user_command('LspStop', function()
	vim.lsp.stop_client(vim.lsp.get_active_clients())

	lsp_zero.on_attach(function()
		vim.lsp.stop_client(vim.lsp.get_active_clients())
	end)
end, {})
