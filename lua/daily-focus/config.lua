local M = {}

local defaults = {
	tips_file = vim.fn.expand("$HOME/.config/nvim/tips.txt"),
}

M.options = {}

function M.setup(opts)
	M.options = vim.tbl_deep_extend("force", defaults, opts or {})
end

return M
