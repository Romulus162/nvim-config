return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		local eslint_d = require("none-ls.diagnostics.eslint_d")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier.with({
					filetypes = { "html", "css" }
				}),
				null_ls.builtins.formatting.google_java_format,
				null_ls.builtins.diagnostics.checkstyle.with({
					extra_args = { "-c", "/google_checks.xml" },
				}),
				eslint_d.with({
					filetypes = { "html" },
				})
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
