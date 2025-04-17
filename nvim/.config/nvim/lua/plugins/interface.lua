-- ~/.config/nvim/lua/plugins/interface.lua
-- Config about interface, themes, nvim-tree, status bar, ...


return {
  -- Theme
  {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    
    config = function()
      require('github-theme').setup({ })
      vim.cmd('colorscheme github_dark')
    end,
  },
  -- Status Bar
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        theme = 'auto',
      },
    },
  },
  
  -- Neovim Tree 
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- Biểu tượng file (yêu cầu Nerd Font)
    },
    config = function()
      -- Cấu hình nvim-tree
      require("nvim-tree").setup({
        sort = {
          sorter = "case_sensitive",
        },
        view = {
          width = 30,
          side = "left",
        },
        renderer = {
          group_empty = true,
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
          },
        },
        filters = {
          dotfiles = false, -- Hiển thị file ẩn
        },
        git = {
          enable = true,
          ignore = false,
          timeout = 500,
        },
        actions = {
          open_file = {
            quit_on_open = false, -- Đóng nvim-tree sau khi mở file
          },
        },
      })
      -- Phím tắt
      vim.keymap.set("n", "<A-1>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<C-f>", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })
    end
   }
}
