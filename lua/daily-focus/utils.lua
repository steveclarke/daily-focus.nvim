local M = {}

local default_data = vim.fn.json_encode({
	current_line = 0,
	current_date = os.date("%Y-%m-%d"),
	current_tip = "Add some tips to your tip file!",
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

M.init_data = function(config)
	make_data_file(config)
end

return M
