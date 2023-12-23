local utils = require("daily-focus.utils")
local os_date = os.date("%Y-%m-%d")

local M = {}

M.data = {}
M.tips = {}

M.init = function(config, options)
	-- Read the data file and parse it into a table.
	M.data = vim.fn.json_decode(vim.fn.readfile(config.data_file))

	-- Read the tips file and parse it into a table.
	M.tips = vim.fn.readfile(options.tips_file)

	-- If today's date is different from the date in the data file,
	-- advance the tip and update the data file.
	if M.data.current_date ~= os_date then
		M.data.current_date = os_date
		-- TODO: Handle the case where the tips file is shorter than the current line.
		M.data.current_line = M.data.current_line + 1
		utils.write_data_file(config, M.data)
	end
end

M.current_tip = function()
	return M.tips[M.data.current_line]
end

return M
