local M = {}

-- Get the root directory of the current buffer/project
function M.get_root()
	local buf = vim.api.nvim_get_current_buf()
	local filepath = vim.api.nvim_buf_get_name(buf)

	if filepath == "" then
		filepath = nil
	else
		filepath = vim.fs.normalize(filepath)
	end

	local home = vim.loop.os_homedir()

	-- 1. Try to get root from active LSP clients
	local clients = vim.lsp.get_clients({ bufnr = buf })
	for _, client in ipairs(clients) do
		local workspaces = client.config.workspace_folders
		if workspaces then
			for _, folder in ipairs(workspaces) do
				local path = vim.uri_to_fname(folder.uri)
				if filepath and filepath:find(path, 1, true) == 1 then
					return path
				end
			end
		end

		local root_dir = client.config.root_dir
		if root_dir and filepath and filepath:find(root_dir, 1, true) == 1 then
			return root_dir
		end
	end

	-- 2. Look upward for project markers (but stop at $HOME)
	if filepath then
		local root_markers = { ".git", "package.json", "lua" }
		local search_path = vim.fs.dirname(filepath)

		local function is_above_home(path)
			return vim.fs.normalize(path):sub(1, #home) == home
		end

		while is_above_home(search_path) do
			local root = vim.fs.find(root_markers, { path = search_path, type = "file" })[1]
			if root then
				return vim.fs.dirname(root)
			end
			local parent = vim.fs.dirname(search_path)
			if parent == search_path then
				break
			end -- reached root ("/")
			search_path = parent
		end
	end

	-- 3. Fallback to current working directory
	return vim.loop.cwd()
end

return M
