-- ~/.config/nvim/lua/plugins/outline.lua


return {
  'stevearc/aerial.nvim',
  event = { 'BufReadPre', 'BufNewFile' }, -- Tải khi mở file
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- Khuyến nghị để hỗ trợ Tree-sitter
    'nvim-tree/nvim-web-devicons', -- Biểu tượng cho giao diện
  },
  opts = {
    -- Tùy chỉnh cấu hình
    backends = { 'lsp', 'treesitter', 'markdown', 'man' }, -- Nguồn dữ liệu
    layout = {
      max_width = { 40, 0.2 }, -- Chiều rộng tối đa
      min_width = 20, -- Chiều rộng tối thiểu
      default_direction = 'right', -- Vị trí cửa sổ outline
    },
    keymaps = {
      ['<CR>'] = 'actions.jump', -- Nhấn Enter để nhảy đến symbol
      ['<C-v>'] = 'actions.jump_vsplit', -- Mở symbol trong split dọc
      ['<C-s>'] = 'actions.jump_split', -- Mở symbol trong split ngang
      ['q'] = 'actions.close', -- Đóng cửa sổ outline
    },
    show_guides = true, -- Hiển thị đường dẫn dọc
    filter_kind = false, -- Hiển thị tất cả các loại symbol
  },
  config = function(_, opts)
    require('aerial').setup(opts)
    -- Phím tắt để mở outline
    vim.keymap.set('n', '<A-7>', '<cmd>AerialToggle<CR>', { desc = 'Toggle Aerial outline' })
  end,
}
