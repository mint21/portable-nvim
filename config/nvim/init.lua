-- Basic settings
vim.opt.number = true           -- Line numbers
vim.opt.relativenumber = false  -- Relative line numbers
vim.opt.expandtab = true        -- Use spaces instead of tabs
vim.opt.shiftwidth = 4          -- Indent width
vim.opt.tabstop = 4             -- Tab width
vim.opt.smartindent = true      -- Auto indent
vim.opt.wrap = false            -- No line wrap
vim.opt.termguicolors = true    -- True color support

-- Leader key
vim.g.mapleader = ","

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  -- Add plugins here
})

-- Basic keymaps
vim.keymap.set("n", "<leader>w", ":w<CR>")      -- Save
vim.keymap.set("n", "<leader>q", ":q<CR>")      -- Quit
vim.keymap.set("n", "<leader>e", ":Ex<CR>")     -- File explorer
