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

	it("allows setting the data directory", function()
		local df = require("daily-focus")
		local config = require("daily-focus.config")

		-- local test_data_dir = vim.fn.getcwd() .. "/tests/tmp/data"
		local test_data_dir = fixture("tmp/data/")

		df.setup({
			data_dir = test_data_dir,
		})

		assert.equal(config.options.data_dir, test_data_dir)
	end)

	it("creates the date file if it doesn't exist", function()
		-- local df = require("daily-focus")
		-- local config = require("daily-focus.config")
		--
		-- local test_data_dir = fixture("tmp/data/")
		--
		-- df.setup({
		--   data_dir = test_data_dir,
		-- })
		--
		-- local date_file = test_data_dir .. "/date.txt"
		--
		-- local file = io.open(date_file, "r")
		-- assert.is_nil(file, "date file should not exist")
		--
		-- df.setup({
		--   data_dir = test_data_dir,
		-- })
		--
		-- local file = io.open(date_file, "r")
		-- assert.is_not_nil(file, "date file should exist")
	end)
end)
