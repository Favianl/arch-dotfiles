return {
	{
		"stevearc/conform.nvim",
		-- Load the plugin just before saving a file
		event = { "BufWritePre" },

		opts = {
			-- Auto-format on save settings
			format_on_save = {
				timeout_ms = 1000, -- Max time to wait for formatter
				lsp_fallback = true, -- Use LSP formatter if no conform formatter is found
				async = false, -- Wait for formatting to finish before saving (ensures formatted file is saved)
			},

			-- Define formatters by file type
			formatters_by_ft = {
				-- Prettier for common web languages (ensure prettier and prettier-plugin-astro are installed globally)
				javascript = { "prettier" },
				javascriptreact = { "prettier" }, -- .jsx files
				typescript = { "prettier" },
				typescriptreact = { "prettier" }, -- .tsx files
				html = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				graphql = { "prettier" },
				markdown = { "prettier" },
				astro = { "prettier" }, -- Requires 'prettier-plugin-astro'

				lua = { "stylua" },
			},
		},

		-- Optional: Keybinding for manual formatting
		keys = {
			{
				"<leader>fm",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "n",
				desc = "Format current buffer (Conform)",
			},
		},
	},
}
