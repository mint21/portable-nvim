return {
    "neovim/nvim-lspconfig",
    config = function()
        -- Keymaps
        vim.keymap.set("n", "gd", vim.lsp.buf.definition)
        vim.keymap.set("n", "K", vim.lsp.buf.hover)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)

        -- Terraform LSP servers
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "terraform", "tf", "hcl" },
            callback = function(args)
                local root = vim.fs.root(args.buf, { ".terraform", ".git" })

                vim.lsp.start({
                    name = "terraformls",
                    cmd = { "terraform-ls", "serve" },
                    root_dir = root,
                })

                vim.lsp.start({
                    name = "tflint",
                    cmd = { "tflint", "--langserver" },
                    root_dir = root,
                })
            end,
        })

        -- Add to your terraform autocmd
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = { "*.tf", "*.hcl" },
            callback = function()
                vim.lsp.buf.format({ async = false })
            end,
        })

        -- Diagnostic
        vim.keymap.set("n", "<leader>sd", vim.diagnostic.open_float)
        vim.keymap.set("n", "<leader>sn", vim.diagnostic.goto_next) -- "show next"
        vim.keymap.set("n", "<leader>sp", vim.diagnostic.goto_prev) -- "show prev"

        vim.diagnostic.config({
            signs = true,
            virtual_text = false,
            underline = true,
            update_in_insert = false,
        })
    end,
}
