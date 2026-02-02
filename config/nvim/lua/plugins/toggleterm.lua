return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		local status, toggleterm = pcall(require, "toggleterm")
		if not status then
			return
		end

		toggleterm.setup({
			size = 10,
			open_mapping = [[<F7>]],
			dir = "%:p:h",
			shading_factor = 2,
			direction = "horizontal",
			float_opts = {
				border = "curved",
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
		})

		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
			-- vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts) -- conflict with lazygit.nvim
			vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
			vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
			vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
			vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
			vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
		end

		-- if you only want these mappings for toggle term use term://*toggleterm#* instead
		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

		-- One terminal per directory (project)
		local Terminal = require("toggleterm.terminal").Terminal
		local Path = require("plenary.path")
		local terminals_by_path = {}

		vim.keymap.set({ "n", "x", "t" }, "<leader><F7>", function()
			-- Get the directory of the current buffer (file)
			local cwd = Path:new(vim.api.nvim_buf_get_name(0)):parent().filename

			-- Check if the directory is valid
			if vim.fn.isdirectory(cwd) == 1 then
				-- If we don't already have a terminal for this path, create one
				if not terminals_by_path[cwd] then
					terminals_by_path[cwd] = Terminal:new({
						dir = cwd,
					})
				end

				-- Toggle the terminal for this path
				local term = terminals_by_path[cwd]
				term:toggle()

				-- If we're in normal mode inside the terminal, enter insert mode
				if vim.fn.mode() == "n" and vim.o.filetype == "toggleterm" then
					vim.cmd('execute "normal! i"')
				end
			end
		end)
	end,
}
