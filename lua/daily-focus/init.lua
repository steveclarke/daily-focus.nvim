local M = {}

-- TODO: set this path from setup()
local data_dir = os.getenv("HOME") .. "/dotfiles/nvim/.config/nvim/data"
local tip_file_path = data_dir .. "/tips.txt"

local count_lines = function(filename)
	local count = 0
	for _ in io.lines(filename) do
		count = count + 1
	end
	return count
end

-- local setup_config_file = function()
-- 	local file = io.open(data_dir .. "/meta.json", "w") -- Opens a file in write mode
--
-- 	local data = {
-- 		["current_date"] = os.date("%Y-%m-%d"),
-- 		["current_line"] = count_lines(tip_file_path),
-- 	}
--
-- 	local json_data = vim.fn.json_encode(data)
--
-- 	if file then
-- 		file:write(json_data) -- Writes "foo" to the file
-- 		file:close() -- Closes the file
-- 	else
-- 		print("Cannot open file for writing")
-- 	end
-- end

M.fetch_tip = function()
	local tip_file = io.open(tip_file_path, "r")

	if not tip_file then
		print("Error opening tip file " .. tip_file_path)
		return nil
	end

	if count_lines == 0 then
		print("Tip file is empty")
		tip_file:close()
		return nil
	end

	local current_line = 0

	for line in tip_file:lines() do
		current_line = current_line + 1
		if current_line == 12 then
			tip_file:close()
			return line
		end
	end
end

M.setup = function(opts)
	print("Options:", vim.inspect(opts))
end

-- [[ Commands ]]
vim.api.nvim_create_user_command("DailyFocusTip", function()
	print(M.fetch_tip())
end, { bang = true, desc = "Print a random tip from the tip file" })

return M
