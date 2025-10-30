--The below is from the github docs online
--
--
--NOTE: This plugin is only guaranteed to work with specific versions of language parsers (as specified in the lockfile.json).
--When upgrading the plugin, you must make sure that all installed parsers are updated to the latest version via :TSUpdate.
--It is strongly recommended to automate this; e.g., if you are using lazy.nvim, put this in your init.lua file:
--

--Caution

--This plugin does not support lazy-loading.
--Make sure to specify the master branch, as the default branch will switch to main in the future.
return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { 'java', 'lua' }, --redundancy
			auto_install = { enable = true },
			-- apparently this is working, but I can't tell the difference, it very well could be because of my current theme
			-- yeah its like 100% I can't tell highlight is working because theme, whatever.
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
