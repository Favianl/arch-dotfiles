return {
	"numToStr/Comment.nvim",
	dependencies = "nvim-treesitter/nvim-treesitter",
	config = function()
		local prehook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
		require("Comment").setup({
			pre_hook = prehook,
			post_hook = nil,
		})
	end,
}
