return {
  {
    "mfussenegger/nvim-lint",
    config = function()
      local lint = require("lint")

    lint.linters.qmllint = {
        cmd = "/usr/lib64/qt6/bin/qmllint",
        stdin = false,
        append_fname = true,
        args = {},
        stream = "stderr",
        ignore_exitcode = true,
        parser = require("lint.parser").from_errorformat(
          "%f:%l:%c: %trror: %m",
          { source = "qmllint" }
        ),
      }
      lint.linters_by_ft = {
        qml = { "qmllint" },
      }

      local group = vim.api.nvim_create_augroup("qml_lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = group,
        pattern = "*.qml",
        callback = function ()
          lint.try_lint()
        end,
      })
      vim.keymap.set("n", "<leader>gl", function()
        lint.try_lint()
      end, { desc = "lint current file" })
    end,
  },
}
