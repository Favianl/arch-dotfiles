return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
	build = ":TSUpdate",
	event = "VeryLazy",
	config = function()
		local status, treesitter = pcall(require, "nvim-treesitter.configs")
		if not status then
			return
		end

		treesitter.setup({
			highlight = {
				enable = true,
			},
			indent = { enable = true },
			-- autotag = { enable = true },
			ensure_installed = {
				"http",
				"json",
				"javascript",
				"tsx",
				"html",
				"css",
				"markdown",
				"markdown_inline",
				"bash",
				"lua",
				"vim",
			},
			auto_install = true,
			-- context_commentstring = {
			-- 	enable = true,
			-- 	enable_autocmd = false,
			-- },
		})
	end,
}
