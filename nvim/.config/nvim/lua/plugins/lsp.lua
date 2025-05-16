-- Cấu hình plugin cho LSP, autocompletion, và code snippets

return {
  -- LSP core
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' }, -- Tải khi mở file
    dependencies = {
      'williamboman/mason.nvim', -- Quản lý LSP server
      'williamboman/mason-lspconfig.nvim', -- Tích hợp Mason với lspconfig
      'hrsh7th/cmp-nvim-lsp', -- Hỗ trợ autocompletion cho LSP
      { 'j-hui/fidget.nvim', opts = {} }, -- Hiển thị tiến trình LSP
    },
    config = function()
      -- Cấu hình Mason
      require('mason').setup({
        ui = {
          border = 'rounded', -- Giao diện đẹp hơn
        },
      })
      require('mason-lspconfig').setup({
        ensure_installed = {
          'lua_ls', -- Lua (hỗ trợ cấu hình Neovim)
          'pyright', -- Python
          'jdtls', -- Java
          'ts_ls', -- JavaScript/TypeScript
          'clangd', -- C/C++
        },
        automatic_installation = true, -- Tự động cài đặt LSP nếu chưa có
      })

      -- Cấu hình LSP
      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities() -- Tích hợp với nvim-cmp

      -- Lua (hỗ trợ Neovim)
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }, -- Nhận diện biến vim
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file('', true), -- Thêm runtime của Neovim
              checkThirdParty = false, -- Tắt kiểm tra thư viện bên thứ ba
            },
            telemetry = {
              enable = false, -- Tắt telemetry
            },
            format = {
              enable = true, -- Kích hoạt định dạng mã
              defaultConfig = {
                indent_style = 'space',
                indent_size = '2',
              },
            },
          },
        },
      })

      -- Python
      lspconfig.pyright.setup({
        capabilities = capabilities,
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              diagnosticMode = 'workspace',
              useLibraryCodeForTypes = true,
            },
          },
        },
      })

      -- Java
      lspconfig.jdtls.setup({
        capabilities = capabilities,
        settings = {
          java = {
            configuration = {
              runtimes = {
                {
                  name = 'JavaSE-23',
                  path = '/opt/jdk-23', -- Điều chỉnh theo đường dẫn JDK của bạn
                  default = true,
                },
              },
            },
            format = {
              enabled = true,
            },
            signatureHelp = { enabled = true },
            contentProvider = { preferred = 'fernflower' }, -- Decompiler
          },
        },
      })

      -- JavaScript/TypeScript
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
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
        init_options = {
          preferences = {
            includeCompletionsForModuleExports = true,
            includeCompletionsWithInsertText = true,
          },
        },
      })

      -- C/C++
      lspconfig.clangd.setup({
        capabilities = capabilities,
        cmd = { 'clangd', '--background-index', '--clang-tidy' },
        filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
        settings = {
          clangd = {
            compilationDatabasePath = 'build', -- Điều chỉnh nếu cần
          },
        },
      })

      -- Phím tắt cho LSP
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(args)
          local bufopts = { noremap = true, silent = true, buffer = args.buf }
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts) -- Go to definition
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts) -- Go to declaration
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts) -- Go to implementation
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts) -- Find references
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts) -- Hover documentation
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts) -- Rename symbol
          vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, bufopts) -- Code action
          vim.keymap.set('n', '<leader>fm', function()
            require('telescope.builtin').lsp_document_symbols({
              symbols = {
                'class',
                'constructor',
                'enum',
                'function',
                'interface',
                'method',
                'module',
                'struct',
              },
            })
          end, bufopts) -- Liệt kê symbols với Telescope
          vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, bufopts) -- Hiển thị lỗi tại con trỏ
          vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts) -- Chuyển đến lỗi trước
          vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts) -- Chuyển đến lỗi sau
          vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, bufopts) -- Hiển thị danh sách lỗi
        end,
      })

      -- Tích hợp định dạng tự động khi lưu
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('LspFormatOnSave', {}),
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })

      -- Cải thiện hiển thị diagnostics
      vim.diagnostic.config({
        virtual_text = {
          prefix = '●', -- Ký hiệu cho lỗi inline
          source = 'always',
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })
    end,
  },
}