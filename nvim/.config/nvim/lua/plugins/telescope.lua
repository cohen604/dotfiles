return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-symbols.nvim",
		},
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Search for files" })
			vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Search using grep" })
			vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Search git files" })
			vim.keymap.set("n", "<leader>fx", builtin.commands, { desc = "Search commands" })
			vim.keymap.set("n", "<leader>ft", builtin.colorscheme, { desc = "Search colorscheme" })
			vim.keymap.set("n", "<leader>fh", builtin.man_pages, { desc = "Search man page" })
			vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Search keymaps" })
			vim.keymap.set("n", "<leader>S", builtin.symbols, { desc = "Search Symbols" })
			vim.keymap.set(
				"n",
				"<leader>ds",
				require("telescope.builtin").lsp_document_symbols,
				{ desc = "Document Symbols (LSP)" }
			)
			vim.keymap.set(
				"n",
				"<leader>ws",
				require("telescope.builtin").lsp_workspace_symbols,
				{ desc = "Workspace Symbols (LSP)" }
			)
		end,
	},
}
