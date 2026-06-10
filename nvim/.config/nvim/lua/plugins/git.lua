return {
	-- 1. Gutter signs and inline git blame/hunk staging
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			signs = {
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			current_line_blame = true, -- Shows inline git blame for the current line
			current_line_blame_opts = {
				delay = 500, -- Delay before blame shows up (in ms)
			},
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation between changes (hunks)
				map("n", "]c", function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(function()
						gitsigns.nav_hunk("next")
					end)
					return "<Ignore>"
				end, { expr = true, desc = "Next Git Change" })

				map("n", "[c", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						gitsigns.nav_hunk("prev")
					end)
					return "<Ignore>"
				end, { expr = true, desc = "Previous Git Change" })

				-- Actions
				map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Stage Hunk" })
				map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Reset Hunk" })
				map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Preview Hunk Diff" })
			end,
		},
	},

	-- 2. Full Git Dashboard (The VS Code Git panel killer)
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - adds brilliant diff integration
			"nvim-telescope/telescope.nvim", -- optional
		},
		config = true,
		keys = {
			-- Press <leader>gs to toggle the full interactive Git panel
			{ "<leader>gs", "<cmd>Neogit<cr>", desc = "Open Neogit Dashboard" },
		},
	},
}
