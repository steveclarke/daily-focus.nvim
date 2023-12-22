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

	it("allows setting the data directory", function()
		local df = require("daily-focus")
		local config = require("daily-focus.config")

		local test_data_dir = vim.fn.getcwd() .. "/tests/tmp/data"

		df.setup({
			data_dir = test_data_dir,
		})

		assert.equal(config.options.data_dir, test_data_dir)
	end)
end)
