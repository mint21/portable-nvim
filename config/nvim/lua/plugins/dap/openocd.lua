local M = {}

function M.setup(dap)
    dap.adapters.openocd = {
        type = "executable",
        command = "lldb-dap",
        name = "openocd",
    }

    dap.configurations.rust = dap.configurations.rust or {}
    table.insert(dap.configurations.rust, {
        name = "ESP32 (OpenOCD)",
        type = "openocd",
        request = "launch",
        program = function()
            return vim.fn.input("Path to ELF: ", vim.fn.getcwd() .. "/target/xtensa-esp32-none-elf/debug/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        initCommands = {
            "platform select remote-gdb-server",
            "target create ${workspaceFolder}/target/xtensa-esp32-none-elf/debug/<binary>",
            "gdb-remote localhost:3333",
        },
        preRunCommands = {
            "load",
            "mon reset halt",
        },
    })
end

return M
