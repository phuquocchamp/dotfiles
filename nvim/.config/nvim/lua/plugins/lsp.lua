return {
  { "williamboman/mason.nvim", config = true },

  { "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    opts = {
      ensure_installed = { "ts_ls", "pyright", "lua_ls" },
      handlers = {
        function(server)
          require("lspconfig")[server].setup({
            on_attach = function(_, bufnr)
              local opts = function(desc)
                return { buffer = bufnr, desc = desc }
              end
              vim.keymap.set("n", "gd",         vim.lsp.buf.definition,    opts("Go to Definition"))
              vim.keymap.set("n", "gr",         vim.lsp.buf.references,    opts("Find References"))
              vim.keymap.set("n", "K",          vim.lsp.buf.hover,         opts("Hover Documentation"))
              vim.keymap.set("n", "gi",         vim.lsp.buf.implementation,opts("Go to Implementation"))
              vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename,        opts("Rename Symbol"))
              vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action,   opts("Code Action"))
              vim.keymap.set("n", "<leader>d",  vim.diagnostic.open_float, opts("Show Diagnostics"))
              vim.keymap.set("n", "[d",         vim.diagnostic.goto_prev,  opts("Previous Diagnostic"))
              vim.keymap.set("n", "]d",         vim.diagnostic.goto_next,  opts("Next Diagnostic"))
            end,
          })
        end,
      },
    } },

  { "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip" },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"]      = cmp.mapping.confirm({ select = true }),
          ["<Tab>"]     = cmp.mapping.select_next_item(),
          ["<S-Tab>"]   = cmp.mapping.select_prev_item(),
          ["<C-e>"]     = cmp.mapping.abort(),
        }),
        sources = { { name = "nvim_lsp" } },
      })
    end },
}
