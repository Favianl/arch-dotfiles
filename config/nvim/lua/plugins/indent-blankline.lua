return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",

	config = function()
		local status, indent_blankline = pcall(require, "ibl")
		if not status then
			return
		end

		local highlight = {
			"IndentBlanklineIndent1",
			"IndentBlanklineIndent2",
			"IndentBlanklineIndent3",
			"IndentBlanklineIndent4",
			"IndentBlanklineIndent5",
			"IndentBlanklineIndent6",
			"IndentBlanklineContextChar",
		}

		local hooks = require("ibl.hooks")
		-- create the highlight groups in the highlight setup hook, so they are reset
		-- every time the colorscheme changes
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "IndentBlanklineIndent1", { fg = "#7a333a" })
			vim.api.nvim_set_hl(0, "IndentBlanklineIndent2", { fg = "#75623e" })
			vim.api.nvim_set_hl(0, "IndentBlanklineIndent3", { fg = "#4b613b" })
			vim.api.nvim_set_hl(0, "IndentBlanklineIndent4", { fg = "#2b5b61" })
			vim.api.nvim_set_hl(0, "IndentBlanklineIndent5", { fg = "#3c6b91" })
			vim.api.nvim_set_hl(0, "IndentBlanklineIndent6", { fg = "#70437d" })
			vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", { fg = "#a6a6a6" })
		end)

		indent_blankline.setup({
			indent = { highlight = highlight, char = "▏" },
			scope = { show_start = false, highlight = "IndentBlanklineContextChar" },
		})
	end,
}
