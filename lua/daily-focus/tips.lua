local utils = require("daily-focus.utils")

local M = {}

local os_date = os.date("%Y-%m-%d")

M.data = {}

M.init = function(config, options)
	M.data = vim.fn.json_decode(vim.fn.readfile(config.data_file))

	-- If today's date is different from the current_date, advance the tip and update the data file.
	if M.data.current_date ~= os_date then
		M.data.current_date = os_date
		M.data.current_tip = "A new tip for today!"
		M.data.current_line = M.data.current_line + 1
		utils.write_data_file(config, M.data)
	end
end

M.current_tip = function()
	return M.data.current_tip
end

return M
