return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        local neotest = require("neotest")
        neotest.setup({
            adapters = {
                require("rustaceanvim.neotest")({
                    args = { "--test" },
                    test_dirs = { "tests" },
                }),
            },
            discovery = {
                enabled = true,
                concurrent = 1,
            },
            quickfix = {
                enabled = false,
            },
        })

        -- keymaps
        vim.keymap.set("n", "<leader>tt", function()
            neotest.run.run()
        end, { desc = "Run nearest test" })
        vim.keymap.set("n", "<leader>tf", function()
            neotest.run.run(vim.fn.expand("%"))
        end, { desc = "Run tests in current file" })
        --vim.keymap.set("n", "<leader>ta", function()
        --    neotest.run.run({ suite = true })
        --end, { desc = "Run all tests in project" })
        vim.keymap.set("n", "<leader>ti", function()
            neotest.run.run(vim.fn.getcwd() .. "/tests")
        end, { desc = "Run all integration tests" })
        vim.keymap.set("n", "<leader>ts", function()
            neotest.summary.toggle()
        end, { desc = "Toggle test summary" })
        vim.keymap.set("n", "<leader>to", function()
            neotest.output.open({ enter = true })
        end, { desc = "Open test output" })
    end
}
