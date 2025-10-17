return {  
  {
    "mason-org/mason.nvim",
    opts = {}
  },
  -- Mason-LSPConfig: tells Mason which servers to install and links them to lspconfig
  {
    'mason-org/mason-lspconfig.nvim',
    opts = {
      ensure_installed = {
        --LSP's found at github.com/neovim/nvim-lspconfig/tree/master/lsp
        'lua_ls', -- Lua (great for editing Neovim config)
        'rust_analyzer', -- Rust
        'jdtls' --Java (you have to be carefule, there is a java_language_server LSP also. This one is the official one)
      },
    },
  },

  -- nvim-lspconfig: connects Neovim to installed LSP servers
  {
    "neovim/nvim-lspconfig",
  },
}
