return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      qml = { "qmlformat" },
    },

    formatters = {
      qmlformat = {
        command = "/usr/lib64/qt6/bin/qmlformat",
        args = { "-i", "$FILENAME" },
        stdin = false,
      },
    },

    format_on_save = function(bufnr)
      if vim.bo[bufnr].filetype == "qml" then
        return { timeout_ms = 3000, lsp_format = "never" }
      end
    end
  },

  keys = {
    {
      "<leader>gf",
      function()
        require("conform").format({ async = false, lsp_format = "never" })
      end,
      desc = "Format buffer",
    },
  },
}
