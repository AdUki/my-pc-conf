vim.cmd [[packadd vimspector]]

vim.g.vimspector_install_gadgets = { 'debugpy', 'vscode-cpptools', 'CodeLLDB' }

vim.keymap.set('n', '<Leader>dd', vim.fn['vimspector#Launch'])
vim.keymap.set('n', '<Leader>dD', vim.fn['vimspector#Reset()'])
vim.keymap.set('n', '<Leader>dc', vim.fn['vimspector#Continue()'])
vim.keymap.set('n', '<Leader>db', vim.fn['vimspector#ToggleBreakpoint()'])
vim.keymap.set('n', '<Leader>dB', vim.fn['vimspector#ClearBreakpoints()'])
vim.keymap.set('n', '<Leader>dr', '<Plug>VimspectorRestart')
vim.keymap.set('n', '<Leader>do', '<Plug>VimspectorStepOut')
vim.keymap.set('n', '<Leader>di', '<Plug>VimspectorStepInto')
vim.keymap.set('n', '<Leader>ds', '<Plug>VimspectorStepOver')
