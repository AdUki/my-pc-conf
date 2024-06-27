vim.g.mapleader = ' '

vim.keymap.set({'n', 'i'}, '<C-_>', '<Plug>(comment_toggle_linewise_current)')
vim.keymap.set('x', '<C-_>', '<Plug>(comment_toggle_linewise_visual)')

-- Move lines with Ctrl+j/k                                                                                                                                                         
vim.keymap.set('n', '<C-j>', ':m .+1<CR>==')
vim.keymap.set('n', '<C-k>', ':m .-2<CR>==')
vim.keymap.set('v', '<C-j>', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<C-k>', ":m '<-2<CR>gv=gv")

-- Repeat last ex command with Alt-.
vim.keymap.set('n', '<M-.>', '@:')

-- use Ctrl+c and Ctrl+v as usual
vim.keymap.set('v', '<C-c>', '"+ygv')
vim.keymap.set('i', '<C-v>', '<C-o>:set paste<CR><C-r>+<C-o>:set nopaste<CR>')

vim.keymap.set('n', '<Leader>u', vim.cmd.UndotreeToggle)

vim.keymap.set('n', '<Leader>dp', vim.cmd.diffput)
vim.keymap.set('n', '<Leader>dg', vim.cmd.diffget)

vim.keymap.set('n', '<Leader>gg', ":Glgrep -I ''<Left>")
vim.keymap.set('n', '<Leader>gw', ":Glgrep -I '<C-r><C-w>'")
vim.keymap.set('x', '<Leader>g',  "y:Glgrep -I '<C-r>0'<Left>")

vim.keymap.set('n', '<Leader>rr', ":Rg -I ''<Left>")
vim.keymap.set('n', '<Leader>rw', ":Rg -I '<C-r><C-w>'")
vim.keymap.set('x', '<Leader>r',  "y:Rg -I '<C-r>0'<Left>")

vim.keymap.set('n', '<C-n>', '<Cmd>lnext<CR>')
vim.keymap.set('n', '<C-p>', '<Cmd>lprev<CR>')
vim.keymap.set('n', '<M-n>', '<Cmd>cnext<CR>')
vim.keymap.set('n', '<M-p>', '<Cmd>cprev<CR>')

vim.keymap.set({'n', 'x'}, '<Leader>ll', function()
	local win_count = #vim.api.nvim_list_wins()
	vim.cmd('lopen')
	if win_count == #vim.api.nvim_list_wins() then
		vim.api.nvim_buf_delete(0, {})
	end
end)

vim.keymap.set({'n', 'x'}, '<Leader>cc', function()
	local win_count = #vim.api.nvim_list_wins()
	vim.cmd('copen')
	if win_count == #vim.api.nvim_list_wins() then
		vim.api.nvim_buf_delete(0, {})
	end
end)

local function is_buf_regular_file(buf)
	return vim.api.nvim_buf_get_option(buf, 'buftype') == ''
end
local function is_buf_modified(buf)
	return vim.api.nvim_buf_get_option(buf, 'modified') == true
end


-- delete current buffer keeping windows layout
vim.keymap.set('n', 'ZX', function()
	local cur_win = vim.api.nvim_get_current_win()
	local cur_buf = vim.api.nvim_get_current_buf()

	for _, win in pairs(vim.api.nvim_list_wins()) do
		if win == cur_win then
		elseif vim.api.nvim_win_get_buf(win) == cur_buf then
			vim.api.nvim_win_close(cur_win, nil)
			return
		elseif is_buf_regular_file(vim.api.nvim_win_get_buf(win)) then
			vim.api.nvim_buf_delete(cur_buf, {})
			return
		end
	end

	if is_buf_regular_file(cur_buf) then
		for _, buf in pairs(vim.api.nvim_list_bufs()) do
			if vim.api.nvim_buf_is_loaded(buf)
				and is_buf_regular_file(buf)
				and buf ~= cur_buf then

				vim.api.nvim_win_set_buf(cur_win, buf)
				vim.api.nvim_buf_delete(cur_buf, {})
				return
			end
		end
		if vim.api.nvim_buf_get_name(cur_buf) ~= ''
			and not is_buf_modified(cur_buf) then
			vim.cmd('enew')
			vim.api.nvim_buf_delete(cur_buf, {})
			vim.api.nvim_create_autocmd({'BufWinLeave'}, {
				buffer = vim.api.nvim_get_current_buf(),
				once = true,
				callback = function(ev)
					if not is_buf_modified(ev.buf) then
						vim.schedule(function() vim.api.nvim_buf_delete(ev.buf, {}) end)
					end
				end
			})
		end
	else
		vim.api.nvim_buf_delete(cur_buf, {})
		if #vim.api.nvim_list_wins() > 1 and cur_win == vim.api.nvim_get_current_win() then
			vim.api.nvim_win_close(cur_win, nil)
		end
	end
end)

-- delete all buffers that are not visible in any window
vim.keymap.set('n', 'ZO', function()
	for _, buf in pairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_loaded(buf) and not is_buf_modified(buf) then

			local found = false
			for _, win in pairs(vim.api.nvim_list_wins()) do
				if vim.api.nvim_win_get_buf(win) == buf then
					found = true
					break
				end
			end

			if found == false then
				vim.api.nvim_buf_delete(buf, {})
			end
		end
	end
end)
