local M = {
  "sindrets/diffview.nvim",
  event = "VeryLazy",
  cmd = {
        'DiffviewOpen',
        'DiffviewClose',
        'DiffviewToggleFiles',
        'DiffviewFocusFiles',
        'DiffviewRefresh',
        'DiffviewFileHistory',
      },
    keys = {
        { '<leader>gf', '<cmd>DiffviewFileHistory %<cr>', desc = 'File History' },
        { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = 'Diff View' },
        { '<leader>gD', '<cmd>:tabclose<cr>', desc = 'Close Diff View' },
      },
    config = function()
      require('diffview').setup({
          keymaps = {
          view = {
            { 'n', 'q', ':DiffviewClose<CR>' },
          },
          file_panel = {
            { 'n', 'q', ':DiffviewClose<CR>' },
          },
          file_history_panel = {
            { 'n', 'q', ':DiffviewClose<CR>' },
          },
        },
        })
    end,


}

--function M.config() 
-- keymaps = {
--                view = {
--                    ["<C-g>"] = "<CMD>DiffviewClose<CR>",
--                    --["c"] = "<CMD>DiffviewClose|Neogit commit<CR>",
--                },
--                file_panel = {
--                    ["<C-g>"] = "<CMD>DiffviewClose<CR>",
--                    --["c"] = "<CMD>DiffviewClose|Neogit commit<CR>",
--                },
--                use_icons = false,
--            },
--  end

return M
