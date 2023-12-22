describe("daily focus", function()
	it("can be required", function()
		require("daily-focus")
	end)

	it("allows setting the tips file path", function()
		local df = require("daily-focus")
		local config = require("daily-focus.config")

		df.setup({
			tips_file = "data/tips.txt",
		})

		assert.equal(config.options.tips_file, "data/tips.txt")
	end)
end)
