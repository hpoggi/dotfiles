

return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
  {
      "<leader>a",
      function()
        require('harpoon'):list():append()
      end,
  },
  {
      "<C-e>",
      function()
        require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())
      end,
  },
  {
      "<C-j>",
      function()
        require('harpoon').list():select(1)
      end,
  },
  {
      "<C-k>",
      function()
        require('harpoon').list():select(2)
      end,
  },
  {
      "<C-l>",
      function()
        require('harpoon').list():select(3)
      end,
  },
  {
      "<C-;>",
      function()
        require('harpoon').list():select(4)
      end,
  },
  {
      "<C-S-P>",
      function()
        require('harpoon').list():prev()
      end,
  },
  {
      "<C-S-N>",
      function()
        require('harpoon').list():next()
      end,
  },
  },
  config = function()
   require('harpoon'):setup({
        settings = {
          save_on_toggle = true,
        }
      })



  end,
}
