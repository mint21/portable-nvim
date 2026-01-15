return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    cmd = "Trouble",
    keys = {
        {
            "<leader>xx",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
        },
        {
            "<leader>xd",
            "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            desc = "Buffer Diagnostics (Trouble)",
        },
    },
    config = function()
        require("trouble").setup()

        -- Navigate in Trouble window with j/k, Enter to jump
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "trouble",
            callback = function()
                vim.keymap.set("n", "<CR>", "<cmd>lua require('trouble').action('jump')<cr>", { buffer = true })
                vim.keymap.set("n", "q", "<cmd>Trouble diagnostics toggle<cr>", { buffer = true })
            end,
        })
    end,
}
