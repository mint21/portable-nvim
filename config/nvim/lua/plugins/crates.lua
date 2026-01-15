return {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("crates").setup()

        -- Keymaps for Cargo.toml
        vim.keymap.set("n", "<leader>ct", require("crates").toggle, { desc = "Toggle crates info" })
        vim.keymap.set("n", "<leader>cu", require("crates").update_crate, { desc = "Update crate" })
        vim.keymap.set("n", "<leader>cU", require("crates").upgrade_crate, { desc = "Upgrade crate" })
    end,
}
