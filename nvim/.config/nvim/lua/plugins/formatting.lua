return {
	-- Treesitter: syntax highlighting + indentation
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			-- New nvim-treesitter API: configs module removed.
			-- Highlighting is handled by neovim built-in (0.10+).
			-- This just installs parsers on first launch.
			require("nvim-treesitter.install").install({
				"lua",
				"python",
				"javascript",
				"typescript",
				"tsx",
				"json",
				"bash",
				"markdown",
			})
		end,
	},

	-- Mason tool installer: ensure formatters are installed
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = { "prettier", "ruff", "stylua" },
		},
	},

	-- conform.nvim: formatting
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ lsp_fallback = true })
				end,
				desc = "Format Buffer",
			},
		},
		opts = {
			formatters_by_ft = {
				python = { "ruff_format", "ruff_organize_imports" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				json = { "prettier" },
				jsonc = { "prettier" },
				lua = { "stylua" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		},
	},
}
