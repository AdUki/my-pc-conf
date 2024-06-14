-- disable netrw at the very start of your init.lua
-- required by nvim-tree plugin
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("plugins")
require("remap")
require("config")
