return {
	-- {
	-- 	"aylur/nucharm.nvim",
	-- 	config = function()
	-- 		local scheme = vim.fn.system({
	-- 			"gsettings",
	-- 			"get",
	-- 			"org.gnome.desktop.interface",
	-- 			"color-scheme",
	-- 		})
	--
	-- 		if vim.fn.trim(scheme, "") == "'prefer-dark'" then
	-- 			vim.opt.background = "dark"
	-- 		else
	-- 			vim.opt.background = "light"
	-- 		end
	--
	-- 		vim.cmd("colorscheme nucharm")
	-- 	end,
	-- },

	{
		"neanias/everforest-nvim",
		config = function()
			local scheme = vim.fn.system({
				"gsettings",
				"get",
				"org.gnome.desktop.interface",
				"color-scheme",
			})

			if vim.fn.trim(scheme, "") == "'prefer-dark'" then
				vim.opt.background = "dark"
			else
				vim.opt.background = "light"
			end

			vim.cmd("colorscheme everforest")
		end,
	},

	-- {
	-- 	"ellisonleao/gruvbox.nvim",
	-- 	config = function()
	-- 		require("gruvbox").setup({
	-- 			terminal_colors = true, -- add neovim terminal colors
	-- 			undercurl = true,
	-- 			underline = true,
	-- 			bold = true,
	-- 			italic = {
	-- 				strings = true,
	-- 				emphasis = true,
	-- 				comments = true,
	-- 				operators = false,
	-- 				folds = true,
	-- 			},
	-- 			strikethrough = true,
	-- 			invert_selection = false,
	-- 			invert_signs = false,
	-- 			invert_tabline = false,
	-- 			inverse = true, -- invert background for search, diffs, statuslines and errors
	-- 			contrast = "", -- can be "hard", "soft" or empty string
	-- 			palette_overrides = {},
	-- 			overrides = {},
	-- 			dim_inactive = false,
	-- 			transparent_mode = false,
	-- 		})
	-- 		vim.cmd("colorscheme gruvbox")
	-- 	end,
	-- },
	{
		"folke/snacks.nvim",
		lazy = false,
		opts = {
			dashboard = { enabled = false },
			indent = {
				indent = {
					hl = "LineNr",
					char = "┊",
				},
				scope = {
					hl = "SnacksIndent",
				},
			},
		},
	},
}
