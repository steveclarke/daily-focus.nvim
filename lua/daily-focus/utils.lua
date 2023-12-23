local M = {}

local make_data_file = function(config)
	print("Making data file " .. config.data_file .. "...")
	local data_file = config.data_file
	if vim.fn.filereadable(data_file) == 0 then
		local file = io.open(data_file, "w")
		file:write("{}")
		file:close()
	end
end

M.init_data = function(config)
	make_data_file(config)
end

return M
