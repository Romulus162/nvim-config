return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function ()
		vim.cmd("colorscheme tokyonight-night")
		-- night, storm, day, moon
	end,
}
