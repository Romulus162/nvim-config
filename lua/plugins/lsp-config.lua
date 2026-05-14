return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"shellcheck",
					"shfmt",
					"pylint",
				},
			})
		end,
	},
	-- Mason-LSPConfig: tells Mason which servers to install and links them to lspconfig
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				--LSP's found at github.com/neovim/nvim-lspconfig/tree/master/lsp
				"lua_ls", -- Lua (great for editing Neovim config)
				"bashls",
				"html",
				"cssls",
				--	"rust_analyzer", -- Rust
				"jdtls", --Java (you have to be carefule, there is a java_language_server LSP also. This one is the official one)
				"qmlls",
				"pyright",
			},
			automatic_enable = {
				exclude = { "rust_analyzer" },
			},
		},
	},

	-- nvim-lspconfig: connects Neovim to installed LSP servers
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.filetype.add({
				extension = {
					v = "coq",
				},
			})
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
			})

			vim.lsp.config("coq_lsp", {
				cmd = {
					"coq-lsp",
				},
				filetypes = { "coq" },
				root_markers = { "_CoqProject", ".git" },
			})
			--	vim.lsp.config("rust_analyzer", {
			--		capabilities = capabilities,
			--	})
			vim.lsp.config("jdtls", {
				capabilities = capabilities,
			})
			vim.lsp.config("html", {
				capabilities = capabilities,
			})
			vim.lsp.config("cssls", {
				capabilities = capabilities,
			})
			vim.lsp.config("bashls", {
				capabilities = capabilities,
			})
			vim.lsp.config("pyright", {
				capabilities = capabilities,
			})
			vim.lsp.config("qmlls", {
				cmd = { "/usr/lib64/qt6/bin/qmlls" },
				filetypes = { "qml", "qmljs" },
				root_markers = { ".git" },
				capabilities = capabilities,
			})

			vim.lsp.enable("html")
			vim.lsp.enable("lua_ls")
			--			vim.lsp.enable("rust_analyzer")
			vim.lsp.enable("jdtls")
			vim.lsp.enable("pyright")
			vim.lsp.enable("qmlls")
			vim.lsp.enable("bashls")
			vim.lsp.enable("coq_lsp")
		end,
	},
}
