-- ~/.config/nvim/lua/plugins/lsp.lua
-- Cấu hình plugin cho LSP, autocompletion, và code snippets

return {
  -- LSP core
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' }, -- Tải khi mở file
    dependencies = {
      'williamboman/mason.nvim', -- Quản lý LSP server
      'williamboman/mason-lspconfig.nvim', -- Tích hợp Mason với lspconfig
    },
    config = function()
      -- Cấu hình Mason
      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = {
          'lua_ls', -- Lua (hỗ trợ cấu hình Neovim)
          'pyright', -- Python
          'jdtls', -- Java
          'ts_ls', -- JavaScript/TypeScript
          'clangd', -- C/C++
        },
      })

      -- Cấu hình LSP
      local lspconfig = require('lspconfig')

      -- Lua (hỗ trợ Neovim)
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }, -- Nhận diện biến vim
            },
          },
        },
      })

      -- Python
      lspconfig.pyright.setup({})

      -- Java
      lspconfig.jdtls.setup({})

      -- JavaScript/TypeScript
      lspconfig.ts_ls.setup({
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = 'all',
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
          javascript = {
            inlayHints = {
              includeInlayParameterNameHints = 'all',
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
        },
      })

      -- C/C++
      lspconfig.clangd.setup({})

      -- Phím tắt cho LSP
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(args)
          local bufopts = { noremap = true, silent = true, buffer = args.buf }
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts) -- Go to definition
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts) -- Hover documentation
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts) -- Rename symbol
          vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts) -- Code action
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts) -- Find references
        end,
      })
    end,
  } -- Removed trailing comma
} -- Ensure closing brace for the outer return table