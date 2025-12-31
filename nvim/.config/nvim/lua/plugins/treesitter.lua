return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local parsers = {
			"lua",
			"vim",
			"vimdoc",
			"query",
			"bash",
			"python",
			"javascript",
			"typescript",
			"tsx",
			"json",
			"yaml",
			"toml",
			"markdown",
			"markdown_inline",
			"svelte",
			"sql",
			"terraform",
			"hcl",
			"rust",
		}
		require("nvim-treesitter").install(parsers)
	end,
}
