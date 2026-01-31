return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"nvim-neotest/neotest-jest",
		"marilari88/neotest-vitest",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-jest")({
					jestCommand = "npm test --",
				}),
				require("neotest-vitest"),
			},
		})
	end,
}
