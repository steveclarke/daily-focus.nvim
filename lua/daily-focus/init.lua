local config = require("daily-focus.config")
local tips = require("daily-focus.tips")

local M = {}

M.setup = function(opts)
	config.setup(opts)
end

M.current_tip = tips.current_tip

return M
