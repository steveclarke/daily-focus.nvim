local M = {}

-- TODO: set this path from setup()
local DATA_DIR = os.getenv("HOME") .. "/dotfiles/nvim/.config/nvim/data"
local TIP_FILE_PATH = DATA_DIR .. "/tips.txt"

local count_lines = function(filename)
	local count = 0
	for _ in io.lines(filename) do
		count = count + 1
	end
	return count
end

local init_meta = function()
	local file = io.open(DATA_DIR .. "/meta.json", "w")

	local data = {
		["current_date"] = os.date("%Y-%m-%d"),
		["current_line"] = count_lines(TIP_FILE_PATH),
	}

	local json_data = vim.fn.json_encode(data)

	if file then
		file:write(json_data)
		file:close()
	else
		print("Cannot open file for writing")
	end
end

M._meta = {}

M.fetch_meta = function()
	-- check if meta file exists
	local file = io.open(DATA_DIR .. "/meta.json", "r")
	if not file then
		-- return nil
		init_meta()
	end
	local content = file:read("*all")
	file:close()

	-- parse the json in the meta.json file and add it to M._meta
	local meta = vim.fn.json_decode(content)

	-- if the current date is not the same as the date in the meta file, increment the current_line
	if meta["current_date"] ~= os.date("%Y-%m-%d") then
		-- if the next number is higher than the total number of lines, reset to 1
		if meta["current_line"] + 1 > count_lines(TIP_FILE_PATH) then
			meta["current_line"] = 1
		else
			meta["current_line"] = meta["current_line"] + 1
		end
		meta["current_date"] = os.date("%Y-%m-%d")
		-- write this to the meta file
		local meta_file = io.open(DATA_DIR .. "/meta.json", "w") -- Opens a file in write mode
		if meta_file then
			meta_file:write(vim.fn.json_encode(meta)) -- Writes "foo" to the file
			meta_file:close() -- Closes the file
		else
			print("Cannot open file for writing")
		end
	end

	M._meta = meta
end

M.setup = function(opts)
	print("Options:", vim.inspect(opts))
end

M.fetch_tip = function()
	-- get the current line number from the meta file
	M.fetch_meta()

	local tip_file = io.open(TIP_FILE_PATH, "r")

	if not tip_file then
		print("Error opening tip file " .. TIP_FILE_PATH)
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
		if current_line == tonumber(M._meta["current_line"]) then
			tip_file:close()
			return line
		end
	end
end

-- [[ Commands ]]
vim.api.nvim_create_user_command("DailyFocusTip", function()
	print(M.fetch_tip())
end, { bang = true, desc = "Print a random tip from the tip file" })

return M
