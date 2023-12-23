local M = {}

M.data = {}

M.init = function(config, options)
	print("Initializing tips")
	M.data = vim.fn.json_decode(vim.fn.readfile(config.data_file))
	vim.print(M.data)
	-- fetch the data file
	-- look at the current_date
	-- is it different from today's date?
	--   yes: update the current_tip, current_line, and current_date
end

M.current_tip = function()
	return M.data.current_tip
end

return M
