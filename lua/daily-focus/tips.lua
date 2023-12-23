local M = {}

M.init = function(config, options)
	print("Initializing tips")
	local data = vim.fn.json_decode(vim.fn.readfile(config.data_file))
	vim.print(data)
	-- fetch the data file
	-- look at the current_date
	-- is it different from today's date?
	--   yes: update the current_tip and current_date, then fetch today's tips
	--   no: fetch today's tips
end

return M
