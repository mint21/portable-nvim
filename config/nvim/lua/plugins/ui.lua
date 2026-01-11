return {
    { "nvim-tree/nvim-web-devicons" },
    { "lewis6991/gitsigns.nvim",             opts = {} },
    { "folke/which-key.nvim",                opts = {} },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    {
        "akinsho/bufferline.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = { theme = "gruvbox" },
        },
    },
}
