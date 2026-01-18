local M = {}

function M.setup(dap)
    dap.adapters.probe_rs = {
        type = "server",
        port = "${port}",
        executable = {
            command = "probe-rs",
            args = { "dap-server", "--port", "${port}" },
        }
    }

    dap.configurations.rust = dap.configurations.rust or {}
    table.insert(dap.configurations.rust, {
        name = "ESP32-S3 (probe-rs)",
        type = "probe_rs",
        request = "launch",
        chip = "esp32s3",
        coreConfigs = {
            {
                coreIndex = 0,
                programBinary = function()
                    return vim.fn.input("Path to ELF: ", vim.fn.getcwd() .. "/target/xtensa-esp32s3-none-elf/debug/",
                        "file")
                end,
            }
        },
    })
end

return M
