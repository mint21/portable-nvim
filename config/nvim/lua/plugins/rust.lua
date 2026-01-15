return {
    {
        "mrcjkb/rustaceanvim",
        version = "^4",
        ft = { "rust" },
        config = function()
            vim.g.rustaceanvim = {
                server = {
                    settings = {
                        ["rust-analyzer"] = {
                            cargo = { allFeatures = true },
                            check = { command = "clippy" },
                        },
                    },
                },
            }

            vim.keymap.set("n", "<leader>rh", function()
                vim.cmd.RustLsp({ 'hover', 'actions' })
            end, { desc = "Rust hover actions" })

            vim.keymap.set("n", "<leader>rd", function()
                vim.cmd.RustLsp('openDocs')
            end, { desc = "Open Rust docs" })
        end,
    },
    {
        "saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<leader>ct", function() require("crates").toggle() end,        desc = "Toggle crates info" },
            { "<leader>cu", function() require("crates").update_crate() end,  desc = "Update crate" },
            { "<leader>cU", function() require("crates").upgrade_crate() end, desc = "Upgrade crate" },
        },
        opts = {},
    },
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        keys = {
            { "<leader>tt", function() require("neotest").run.run() end,                            desc = "Run nearest test" },
            { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end,          desc = "Run tests in file" },
            { "<leader>ti", function() require("neotest").run.run(vim.fn.getcwd() .. "/tests") end, desc = "Run integration tests" },
            { "<leader>ts", function() require("neotest").summary.toggle() end,                     desc = "Toggle test summary" },
            { "<leader>to", function() require("neotest").output.open({ enter = true }) end,        desc = "Open test output" },
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("rustaceanvim.neotest")({ args = { "--test" }, test_dirs = { "tests" } }),
                },
                discovery = { enabled = true, concurrent = 1 },
                quickfix = { enabled = false },
            })
        end,
    },
}
