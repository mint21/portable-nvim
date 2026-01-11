return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    require("gruvbox").setup({
      contrast = "hard", -- or "soft" or "" for medium
    })
    vim.cmd("colorscheme gruvbox")
  end,
}
