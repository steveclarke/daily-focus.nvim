local M = {}

local default_data_file = vim.fn.json_encode({
	current_line = 1,
	current_date = "",
	current_tip = "",
})

local make_data_file = function(config)
	local data_file = config.data_file

	if vim.fn.filereadable(data_file) == 0 then
		local file = io.open(data_file, "w")

		if file == nil then
			print("Could not open file " .. data_file)
			return
		end

		file:write(default_data_file)
		file:close()
	end
end

M.init_data = function(config)
	make_data_file(config)
end

return M
