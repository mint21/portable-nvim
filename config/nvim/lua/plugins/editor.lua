return {
    {
        "numToStr/Comment.nvim", opts = {}
    },
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            require("gruvbox").setup({ contrast = "hard" })
            vim.cmd("colorscheme gruvbox")
        end,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        lazy = false, -- Load immediately
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        keys = {
            { "<leader>e", ":Neotree toggle<CR>" },
            { "<leader>o", "<cmd>Neotree focus<cr>" },
        },
        config = function()
            require("neo-tree").setup({
                close_if_last_window = true,
                window = { width = 30 },
            })
        end,
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = "Trouble",
        keys = {
            { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>" },
            { "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>" },
        },
        config = function()
            require("trouble").setup()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "trouble",
                callback = function()
                    vim.keymap.set("n", "<CR>", "<cmd>lua require('trouble').action('jump')<cr>", { buffer = true })
                    vim.keymap.set("n", "q", "<cmd>Trouble diagnostics toggle<cr>", { buffer = true })
                end,
            })
        end,
    },
    {
        "ANGkeith/telescope-terraform-doc.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        config = function()
            require("telescope").load_extension("terraform_doc")
            vim.keymap.set("n", "<leader>td", "<cmd>Telescope terraform_doc<cr>", { desc = "Terraform docs" })
        end,
    },
}
