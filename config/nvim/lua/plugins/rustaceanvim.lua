return {
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
    end
}
