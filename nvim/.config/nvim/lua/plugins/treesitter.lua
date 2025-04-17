-- ~/.config/nvim/lua/plugins/treesitter.lua
-- Cấu hình plugin cho cú pháp highlight và các tính năng Treesitter

return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate', -- Cập nhật parser khi cài đặt
    event = { 'BufReadPost', 'BufNewFile' }, -- Tải khi mở file
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'lua', 'python', 'javascript', 'java', 'typescript' }, -- Ngôn ngữ hỗ trợ
        highlight = { enable = true }, -- Bật highlight
        indent = { enable = true }, -- Bật tự động thụt lề
        incremental_selection = { -- Chọn code theo khối
          enable = true,
          keymaps = {
            init_selection = 'gnn',
            node_incremental = 'grn',
            scope_incremental = 'grc',
            node_decremental = 'grm',
          },
        },
      }
    end,
  },
}
