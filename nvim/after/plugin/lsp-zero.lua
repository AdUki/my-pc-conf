local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(_, bufnr)
	lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})

require('mason-lspconfig').setup({
	handlers = {
		lsp_zero.default_setup,

		lua_ls = function()
			require('lspconfig').lua_ls.setup({
				settings = {
					Lua = {
						runtime = {
							version = 'LuaJIT'
						},
						diagnostics = {
							globals = {'vim'}
						},
						workspace = {
							library = {
								vim.env.VIMRUNTIME
							}
						}
					}
				}
			})
		end
	}
})

vim.api.nvim_create_user_command('LspStop', function()
	vim.lsp.stop_client(vim.lsp.get_active_clients())

	lsp_zero.on_attach(function()
		vim.lsp.stop_client(vim.lsp.get_active_clients())
	end)
end, {})
