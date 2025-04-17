return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local bufferline_status, bufferline = pcall(require, "bufferline")
		if not bufferline_status then
			return
		end

		bufferline.setup({
			options = {
				indicator = {
					icon = "", -- this should be omitted if indicator style is not 'icon'
					-- style = "icon" | "underline" | "none",
				},
			},
		})
	end,
}
