return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	-- dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
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
				"typescript",
				"tsx",
				"astro",
				"html",
				"css",
				"markdown",
				"markdown_inline",
				"bash",
				"lua",
				"vim",
			},
			textsubjects = {
				enable = true,
			},
			auto_install = true,
			-- context_commentstring = {
			-- 	enable = true,
			-- 	enable_autocmd = false,
			-- },
		})
	end,
}
