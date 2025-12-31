return {
	"EdenEast/nightfox.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("nightfox").setup({
			options = {
				colorblind = {
					enable = true,
					severity = {
						deutan = 1,
						tritan = 0.3,
					},
				},
			},
		})
		vim.cmd.colorscheme("nightfox")
	end,
}
