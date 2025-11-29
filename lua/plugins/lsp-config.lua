return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	-- Mason-LSPConfig: tells Mason which servers to install and links them to lspconfig
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				--LSP's found at github.com/neovim/nvim-lspconfig/tree/master/lsp
				"lua_ls", -- Lua (great for editing Neovim config)
				"html",
				"cssls",
				"rust_analyzer", -- Rust
				"jdtls", --Java (you have to be carefule, there is a java_language_server LSP also. This one is the official one)
			},
		},
	},

	-- nvim-lspconfig: connects Neovim to installed LSP servers
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
			})
			vim.lsp.config("rust_analyzer", {
				capabilities = capabilities,
			})
			vim.lsp.config("jdtls", {
				capabilities = capabilities,
			})
			vim.lsp.config("html", {
				capabilities = capabilities,
			})
			vim.lsp.config("cssls", {
				capabilities = capabilities,
			})

			vim.lsp.enable("html")
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("rust_analyzer")
			vim.lsp.enable("jdtls")
		end,
	},
}
