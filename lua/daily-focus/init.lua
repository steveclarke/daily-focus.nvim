local Config = require("daily-focus.config")
local M = {}

M.setup = function(opts)
	Config.setup(opts)
end

M.fetch_tip = function()
	return "A TIP GO HERE"
end

return M
