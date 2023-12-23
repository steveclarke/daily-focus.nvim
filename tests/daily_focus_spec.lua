local FIXTURES_PATH = vim.fn.getcwd() .. "/tests/fixtures"

local fixture = function(name)
	return FIXTURES_PATH .. "/" .. name
end

describe("daily focus", function()
	it("can be required", function()
		require("daily-focus")
	end)

	it("allows setting the tips file path", function()
		local df = require("daily-focus")
		local config = require("daily-focus.config")

		df.setup({
			tips_file = fixture("tips.txt"),
		})

		assert.equal(config.options.tips_file, fixture("tips.txt"))
	end)
end)
