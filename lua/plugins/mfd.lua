--[[
return {
	"kungfusheep/mfd.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd("colorscheme mfd-stealth")

		vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", {
			fg = "#000000",
		})
	end,
}
--]]
return {}
