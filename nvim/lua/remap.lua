vim.g.mapleader = ' '

vim.keymap.set({'n', 'i'}, '<C-_>', '<Plug>(comment_toggle_linewise_current)')
vim.keymap.set('x', '<C-_>', '<Plug>(comment_toggle_linewise_visual)')

-- Move lines with Ctrl+j/k                                                                                                                                                         
vim.keymap.set('n', '<C-j>', ':m .+1<CR>==')
vim.keymap.set('n', '<C-k>', ':m .-2<CR>==')
vim.keymap.set('v', '<C-j>', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<C-k>', ":m '<-2<CR>gv=gv")

-- use Ctrl+c and Ctrl+v as usual
vim.keymap.set('v', '<C-c>', '"+ygv')
vim.keymap.set('i', '<C-v>', '<C-o>:set paste<CR><C-r>+<C-o>:set nopaste<CR>')

-- vim.keymap.set('n', 'ZX', function() vim.cmd('Bdelete this') end)
vim.keymap.set('n', 'ZX', '<Cmd>Bdelete this<CR>)')
vim.keymap.set('n', 'ZO', '<Cmd>Bdelete hidden<CR>')

vim.keymap.set('n', '<Leader>u', vim.cmd.UndotreeToggle)

vim.keymap.set('n', '<Leader>dp', vim.cmd.diffput)
vim.keymap.set('n', '<Leader>dg', vim.cmd.diffget)

vim.keymap.set('n', '<Leader>gg', ":Glgrep -I ''<Left>")
vim.keymap.set('n', '<Leader>gw', ":Glgrep -I '<C-r><C-w>'")
vim.keymap.set('x', '<Leader>g',  "y:Glgrep -I '<C-r>0'<Left>")

vim.keymap.set('n', '<Leader>rr', ":Rg -I ''<Left>")
vim.keymap.set('n', '<Leader>rw', ":Rg -I '<C-r><C-w>'")
vim.keymap.set('x', '<Leader>r',  "y:Rg -I '<C-r>0'<Left>")

vim.keymap.set({'i', 'n', 'x'}, '<Leader>ll', '<Cmd>lopen<CR>')
vim.keymap.set({'i', 'n', 'x'}, '<Leader>ln', '<Cmd>lnext<CR>')
vim.keymap.set({'i', 'n', 'x'}, '<Leader>lp', '<Cmd>lprev<CR>')

vim.keymap.set({'i', 'n', 'x'}, '<Leader>cc', '<Cmd>copen<CR>')
vim.keymap.set({'i', 'n', 'x'}, '<Leader>cn', '<Cmd>cnext<CR>')
vim.keymap.set({'i', 'n', 'x'}, '<Leader>cp', '<Cmd>cprev<CR>')
