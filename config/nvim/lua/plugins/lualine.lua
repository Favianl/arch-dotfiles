return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local status, lualine = pcall(require, "lualine")
		if not status then
			return
		end

		local colors = {
			blue = "#80a0ff",
			cyan = "#79dac8",
			black = "#080808",
			white = "#c6c6c6",
			red = "#ff5189",
			violet = "#d183e8",
			grey = "#303030",
			bgcenter = "#cc1a1b26", -- cc <- 80% transparency
		}

		local bubbles_theme = {
			normal = {
				a = { fg = colors.black, bg = colors.blue },
				b = { fg = colors.white, bg = colors.grey },
				c = { fg = colors.white, bg = colors.bgcenter },
			},

			insert = { a = { fg = colors.black, bg = colors.cyan } },
			visual = { a = { fg = colors.black, bg = colors.violet } },
			replace = { a = { fg = colors.black, bg = colors.red } },

			inactive = {
				a = { fg = colors.white, bg = colors.black },
				b = { fg = colors.white, bg = colors.black },
				c = { fg = colors.black, bg = colors.black },
			},
		}

		lualine.setup({
			options = {
				theme = bubbles_theme,
				component_separators = "|",
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = {
					{ "mode", separator = { left = "" }, right_padding = 2 },
				},
				lualine_b = { "filename", "branch" },
				lualine_c = {
					"fileformat",
					{
						"diagnostics",

						-- Table of diagnostic sources, available sources are:
						--   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
						-- or a function that returns a table as such:
						--   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
						sources = { "nvim_diagnostic", "coc" },
						-- Displays diagnostics for the defined severity types
						sections = { "error", "warn", "info", "hint" },

						diagnostics_color = {
							-- Same values as the general color option can be used here.
							error = { "DiagnosticError", bg = colors.bgcenter }, -- Changes diagnostics' error color.
							warn = { "DiagnosticWarn", bg = colors.bgcenter }, -- Changes diagnostics' warn color.
							info = { "DiagnosticInfo", bg = colors.bgcenter }, -- Changes diagnostics' info color.
							hint = { "DiagnosticHint", bg = colors.bgcenter }, -- Changes diagnostics' hint color.
						},
						symbols = { error = " ", warn = " ", info = " ", hint = "󰛨 " },
						colored = true, -- Displays diagnostics status in color if set to true.
						update_in_insert = false, -- Update diagnostics in insert mode.
						always_visible = false, -- Show diagnostics even if there are none.
					},
				},
				lualine_x = {},
				lualine_y = { "filetype", "progress" },
				lualine_z = {
					{ "location", separator = { right = "" }, left_padding = 2 },
				},
			},
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			tabline = {},
			extensions = {},
		})
	end,
}
