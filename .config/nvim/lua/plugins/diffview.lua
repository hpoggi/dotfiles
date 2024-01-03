local M = {
  "sindrets/diffview.nvim",
  event = "VeryLazy",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  keys = {
            --{ "<C-g>", "<CMD>DiffviewOpen<CR>", mode = { "n", "i", "v" } }
            { "<leader>gd", "<CMD>DiffviewOpen<CR>", mode = { "n", "i", "v" } }
        },

}

function M.config() end
 keymaps = {
                view = {
                    ["<C-g>"] = "<CMD>DiffviewClose<CR>",
                    --["c"] = "<CMD>DiffviewClose|Neogit commit<CR>",
                },
                file_panel = {
                    ["<C-g>"] = "<CMD>DiffviewClose<CR>",
                    --["c"] = "<CMD>DiffviewClose|Neogit commit<CR>",
                },
                use_icons = false,
            },

return M
