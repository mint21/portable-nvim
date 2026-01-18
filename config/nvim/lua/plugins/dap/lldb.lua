local M = {}

function M.setup(dap)
    dap.adapters.lldb = {
        type = "executable",
        command = "lldb-dap",
        name = "lldb",
    }

    dap.configurations.rust = dap.configurations.rust or {}
    table.insert(dap.configurations.rust, {
        name = "Launch (LLDB)",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
    })
end

return M
