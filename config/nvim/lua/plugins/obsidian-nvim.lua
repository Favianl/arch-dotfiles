return {
	"epwalsh/obsidian.nvim",
	version = "*",
	-- lazy = true,
	-- ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	opts = {
		workspaces = {
			{
				name = "LeoNotes",
				path = "~/Documents/leo-notes",
			},
		},
		completion = {
			nvim_cmp = true,
			min_chars = 2,
		},
		notes_subdir = "box",
		new_notes_location = "box",

		attachments = {
			img_folder = "files",
		},

		daily_notes = {
			template = "note",
		},

		mappings = {
			-- "Obsidian follow"
			["<leader>nf"] = {
				action = function()
					return require("obsidian").util.gf_passthrough()
				end,
				opts = { noremap = false, expr = true, buffer = true },
			},
			-- Toggle check-boxes "obsidian done"
			["<leader>nd"] = {
				action = function()
					return require("obsidian").util.toggle_checkbox()
				end,
				opts = { buffer = true },
			},
			-- Create a new newsletter issue
			["<leader>nn"] = {
				action = function()
					return require("obsidian").commands.new_note("Newsletter-Issue")
				end,
				opts = { buffer = true },
			},
			["<leader>nt"] = {
				action = function()
					return require("obsidian").util.insert_template("Newsletter-Issue")
				end,
				opts = { buffer = true },
			},
		},

		-- Function to generate frontmatter for notes
		note_frontmatter_func = function(note)
			-- This is equivalent to the default frontmatter function.
			local out = { id = note.id, aliases = note.aliases, tags = note.tags }

			-- `note.metadata` contains any manually added fields in the frontmatter.
			-- So here we just make sure those fields are kept in the frontmatter.
			if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
				for k, v in pairs(note.metadata) do
					out[k] = v
				end
			end
			return out
		end,

		-- Function to generate note IDs
		note_id_func = function(title)
			-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
			-- In this case a note with the title 'My new note' will be given an ID that looks
			-- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
			local suffix = ""
			if title ~= nil then
				-- If title is given, transform it into valid file name.
				suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
			else
				-- If title is nil, just add 4 random uppercase letters to the suffix.
				for _ = 1, 4 do
					suffix = suffix .. string.char(math.random(65, 90))
				end
			end
			return tostring(os.time()) .. "-" .. suffix
		end,

		-- Settings for templates
		templates = {
			subdir = "templates", -- Subdirectory for templates
			date_format = "%Y-%m-%d-%a", -- Date format for templates
			gtime_format = "%H:%M", -- Time format for templates
			tags = "", -- Default tags for templates
		},
		ui = {
			enable = false,
		},
	},
}
