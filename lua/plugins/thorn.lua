--[[
return {
	"jpwol/thorn.nvim",
	lazy = false,
	priority = 1000,

	init = function()
		require("thorn").setup({
			theme = "light",
			background = "warm",
		})
		vim.cmd.colorscheme("thorn")
	end,
}
--]]
return {}
