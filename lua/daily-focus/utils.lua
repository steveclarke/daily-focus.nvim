local M = {}

local default_data = vim.fn.json_encode({
	current_line = 1,
	current_date = os.date("%Y-%m-%d"),
})

local make_data_file = function(config)
	local data_file = config.data_file

	if vim.fn.filereadable(data_file) == 0 then
		local file = io.open(data_file, "w")
		if file then
			file:write(default_data)
			file:close()
		else
			print("Could not create data file" .. data_file)
		end
	end
end

M.write_data_file = function(config, data)
	local data_file = config.data_file
	local file = io.open(data_file, "w")
	if file then
		file:write(vim.fn.json_encode(data))
		file:close()
	else
		print("Could not write to data file" .. data_file)
	end
end

M.init_data = function(config)
	make_data_file(config)
end

return M
