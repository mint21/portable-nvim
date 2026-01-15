return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = true,
            window = {
                width = 30,
            },
        })

        vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>")
        vim.keymap.set("n", "<leader>o", "<cmd>Neotree focus<cr>") -- "o" for focus tree
    end,
}
