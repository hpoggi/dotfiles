vim.print('Haloo2')
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
--local key_mapper = function(mode, key, result)
--	vim.api.nvim_set_keymap(
--		mode,
--		key,
--		result,
--		{ noremap = true, silent = true }
--	)
--end
--key_mapper('i', 'jk', '<ESC>')
--key_mapper('v', 'jk', '<ESC>')
--key_mapper('n', 'cD', function()
--	vim.cmd.lcd'%:p:h'
--	local dir=vim.fs.dirname(vim.fs.find('.git',{upward=true})[1])
--	if dir then vim.cmd('cd '..dir) end
--	vim.cmd.pwd()
--end)
