vim.g.mapleader = ","

require("config.lazy")
require("config.options")
require("config.keymaps")

vim.cmd("colorscheme iceberg")

-- After dapui.setup(), add:
vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = '#ff0000', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'DapStopped', { fg = '#00ff00', bg = 'NONE' })

vim.fn.sign_define('DapBreakpoint', {
    text = '●',
    texthl = 'DapBreakpoint',
    linehl = '',
    numhl = ''
})

vim.fn.sign_define('DapStopped', {
    text = '→',
    texthl = 'DapStopped',
    linehl = 'Visual', -- Highlights the entire line
    numhl = ''
})
