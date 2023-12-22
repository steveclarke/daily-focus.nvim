local M = {}

local defaults = {
	tips_file = vim.fn.expand("$HOME/.config/nvim/tips.txt"),
	data_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/daily-focus"),
}

M.options = {}

function M.setup(opts)
	M.options = vim.tbl_deep_extend("force", defaults, opts or {})

	-- create the data directory if it doesn't exist
	vim.fn.mkdir(M.options.data_dir, "p")
end

return M
