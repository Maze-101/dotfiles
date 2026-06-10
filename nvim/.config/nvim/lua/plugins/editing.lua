return {
	{
		"echasnovski/mini.pairs",
		version = false,
		config = function()
			require("mini.pairs").setup({
				modes = { insert = true, command = false, terminal = false },
			})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true, -- Auto close tags
					enable_rename = true, -- Auto rename pairs
					enable_close_on_slash = true, -- Auto close on trailing </
				},
			})
		end,
	},
	{
		"echasnovski/mini.surround",
		version = false,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("mini.surround").setup({
				-- Map of global actions.
				mappings = {
					add = "sa", -- Add surrounding in Normal and Visual modes
					delete = "sd", -- Delete surrounding
					find = "sf", -- Find surrounding (to the right)
					find_left = "sF", -- Find surrounding (to the left)
					highlight = "sh", -- Highlight surrounding
					replace = "sr", -- Replace surrounding
					update_n_lines = "sn", -- Update `n_lines`
				},
			})
		end,
	},
}
