-- ~/.config/nvim/lua/plugins/terminal.lua

return {
  'akinsho/toggleterm.nvim',
  version = '*', -- Sử dụng phiên bản mới nhất
  event = { 'BufReadPre', 'BufNewFile' }, -- Tải khi mở file
  opts = {
    size = 20, -- Kích thước terminal (chiều cao nếu ngang, chiều rộng nếu dọc)
    open_mapping = [[<A-8>]], -- Phím tắt để toggle terminal (Alt+8)
    hide_numbers = true, -- Ẩn số dòng trong terminal
    shade_terminals = true, -- Làm tối nền terminal
    shading_factor = 2, -- Độ tối của nền
    start_in_insert = true, -- Bắt đầu ở chế độ insert
    insert_mappings = true, -- Cho phép phím tắt trong chế độ insert
    persist_size = true, -- Giữ kích thước terminal
    direction = 'float', -- Kiểu terminal: 'float', 'horizontal', 'vertical', 'tab'
    close_on_exit = true, -- Đóng terminal khi lệnh hoàn thành
    shell = vim.o.shell, -- Shell mặc định (bash, zsh, powershell, ...)
    float_opts = {
      border = 'curved', -- Viền cửa sổ nổi: 'single', 'double', 'shadow', 'curved'
      winblend = 0, -- Độ trong suốt
      highlights = {
        border = 'Normal',
        background = 'Normal',
      },
    },
  },
  config = function(_, opts)
    require('toggleterm').setup(opts)
  end,
}