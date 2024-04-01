vim.g.mapleader = " "

-- greatest remap ever
 vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
 vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
 vim.keymap.set("n", "<leader>Y", [["+Y]])

 vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])



vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

local key_mapper = function(mode, key, result)
	vim.api.nvim_set_keymap(
		mode,
		key,
		result,
		{ noremap = true, silent = true }
	)
end
key_mapper('i', 'jk', '<ESC>')
key_mapper('v', 'jk', '<ESC>')

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

--key_mapper('n', 'cD', function()
--	vim.cmd.lcd'%:p:h'
--	local dir=vim.fs.dirname(vim.fs.find('.git',{upward=true})[1])
--	if dir then vim.cmd('cd '..dir) end
--	vim.cmd.pwd()
--end)

local rename = function()
  --local file = vim.uv.fs_realpath(vim.fn.expand('$HOME/.nvim/backups/'))
  --filename = vim.fn.expand("%:t:r")
  --filename = string.sub(filename, 14, -1)
  --filename = string.gsub(filename, "_", " ")
  --vim.api.nvim_put({ filename }, "", true, true)
  --vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  --vim.fn.mkdir(vim.fn.fnamemodify(vim.fn.expand('$HOME/.nvim/backups/'), ":p:h"), "p")
  --local old_name = vim.fn.expand("%")
  --print("A: ", old_name)
  --local new_name = vim.fn.input("File: ", "", "file")
  --print("B ", new_name)
  --print("isDirectory ", vim.fn.isdirectory(old_name))
  --if old_name  mv
  local notes_dir = vim.fn.expand('$HOME/.nvim/notes/')
  if vim.fn.isdirectory(notes_dir) == 0 then
    vim.fn.mkdir(vim.fn.fnamemodify(notes_dir, ":p:h"), "p")
  end
  local filename = notes_dir..os.date('%Y-%m-%d_%H:%M:%S')..'.txt'
  vim.cmd.edit(filename)
end
vim.keymap.set("n", "<leader>mv", rename)

--vim.keymap.set("n", "<leader>mv", vim.cmd[[
--let old_name = expand('%')
--echo old_name
--let new_name = input('New file name: ', expand('%'), 'file')
--if new_name != '' && new_name != old_name
--  exec ':saveas ' . new_name
--  exec ':silent !rm ' . old_name
--  redraw!
--endif
--]])
--
