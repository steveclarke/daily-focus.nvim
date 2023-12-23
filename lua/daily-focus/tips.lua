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
	-- TODO: Handle the case where the tips file is empty.
	-- TODO: Handle the case where the current_tip number is greater than the number of tips.
	if M.data.current_date ~= os_date then
		M.data.current_date = os_date

		-- If the current line is the last line, reset it to the first line,
		-- otherwise advance it by one.
		if M.data.current_line == #M.tips then
			M.data.current_line = 1
		else
			M.data.current_line = M.data.current_line + 1
		end

		utils.write_data_file(config, M.data)
	end
end

M.current_tip = function()
	return M.tips[M.data.current_line]
end

return M
