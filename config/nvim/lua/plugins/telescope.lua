return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
	},

	config = function()
		require("telescope").setup({
			pickers = {
				find_files = {
					follow = true,
					hidden = true,
					no_ignore = true,
				},
			},
		})

		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
		-- vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
		vim.keymap.set("n", "<leader>fl", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
		vim.keymap.set("n", "<leader>fg", function()
			builtin.git_files({
				show_untracked = true,
			})
		end)

		vim.keymap.set("n", "<leader>f.", ":Telescope find_files cwd=~/<CR>")
		vim.keymap.set("n", "<leader>fn", ":Telescope find_files cwd=~/.config/nvim<CR>")
		-- vim.keymap.set("n", "<leader>fe", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
		vim.keymap.set("n", "<leader>fe", ":Telescope file_browser path=%:p:h<CR>")

		require("telescope").load_extension("fzf")
	end,
}
