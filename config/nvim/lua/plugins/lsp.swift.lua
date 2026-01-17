return {
    "neovim/nvim-lspconfig",
    ft = "swift",
    config = function()
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "swift",
            callback = function(args)
                local root = vim.fs.root(args.buf, { "Package.swift", ".git" })

                vim.lsp.start({
                    name = "sourcekit-lsp",
                    cmd = { "xcrun", "sourcekit-lsp" },
                    root_dir = root,
                    capabilities = require('cmp_nvim_lsp').default_capabilities(),
                })
            end,
        })

        -- Auto-format Swift on save
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*.swift",
            callback = function()
                vim.lsp.buf.format({ async = false })
            end,
        })
    end,
}
