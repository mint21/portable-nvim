return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.lsp.config["rust_analyzer"] = {
      cmd = { "rust-analyzer" },
      root_markers = { "Cargo.toml" },
      settings = {
        ["rust-analyzer"] = {
          cargo = { 
            allFeatures = true,
          },
          check = {
            command = "clippy",
          },
        },
      },
    }
    
    vim.lsp.enable("rust_analyzer")
    
    vim.keymap.set("n", "gd", vim.lsp.buf.definition)
    vim.keymap.set("n", "K", vim.lsp.buf.hover)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
  end,
}
