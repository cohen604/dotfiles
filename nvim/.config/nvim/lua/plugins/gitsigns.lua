return {
	"lewis6991/gitsigns.nvim",
	lazy = false,
	config = function()
	  require("gitsigns").setup({
		attach_to_untracked = true, -- or keep false and `git add` the file(s)
		current_line_blame = true,
		current_line_blame_opts = {
		  delay = 0,
		  virt_text_pos = "right_align",
		},
		on_attach = function(bufnr)
		  local gitsigns = require("gitsigns")

		  local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		  end

		  map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Toggle line blame" })
		  map("n", "<leader>gb", function() gitsigns.blame_line({ full = true }) end, { desc = "Blame line (popup)" })
		end,
	  })
	end,
  }
