local utils = require("daily-focus.utils")
local tips = require("daily-focus.tips")

local data_dir = vim.fn.expand(vim.fn.stdpath("data"))

local default_options = {
	tips_file = vim.fn.expand("$HOME/.config/nvim/tips.txt"),
}

local M = {}

M.options = {}

M.config = {
	data_dir = data_dir,
	data_file = data_dir .. "/daily-focus.json",
}

M.setup = function(opts)
	-- Merge user-supplied options with defaults.
	M.options = vim.tbl_deep_extend("force", default_options, opts or {})

	utils.init_data(M.config)
	tips.init(M.config, M.options)
end

return M
