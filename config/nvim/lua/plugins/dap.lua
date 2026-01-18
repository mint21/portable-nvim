return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            -- Setup dap-ui
            dapui.setup()

            -- Auto open/close UI
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            local os = vim.loop.os_uname().sysname

            if os == "Darwin" or os == "Linux" then
                -- probe-rs adapter
                dap.adapters.probe_rs = {
                    type = 'server',
                    port = '${port}',
                    executable = {
                        command = 'probe-rs',
                        args = { 'dap-server', '--port', '${port}' },
                    }
                }

                -- Rust debugger (lldb)
                dap.adapters.lldb = {
                    type = "executable",
                    command = vim.fn.exepath("lldb-dap"),
                    name = "lldb",
                }

                dap.configurations.rust = {
                    {
                        name = "ESP32-S3 Debug",
                        type = "probe_rs",
                        request = "launch",
                        chip = "esp32s3",
                        coreConfigs = {
                            {
                                coreIndex = 0,
                                programBinary = function()
                                    return vim.fn.input("Path to ELF: ",
                                        vim.fn.getcwd() .. "/target/xtensa-esp32s3-none-elf/debug/", "file")
                                end,
                            }
                        },
                    },
                    {
                        name = "Launch (LLDB)",
                        type = "lldb",
                        request = "launch",
                        program = function()
                            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
                        end,
                        cwd = "${workspaceFolder}",
                        stopOnEntry = false,
                    },
                }
            else
                -- Rust debugger (codelldb)
                dap.adapters.codelldb = {
                    type = "executable",
                    command = vim.fn.exepath("codelldb"),
                    name = "codelldb",
                    detached = false,
                }

                dap.configurations.rust = {
                    {
                        name = "Launch",
                        type = "codelldb",
                        request = "launch",
                        program = function()
                            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
                        end,
                        cwd = "${workspaceFolder}",
                        stopOnEntry = false,
                    },
                }
            end

            -- Keymaps
            vim.keymap.set("n", "<F5>", dap.continue)
            vim.keymap.set("n", "<F10>", dap.step_over)
            vim.keymap.set("n", "<F11>", dap.step_into)
            vim.keymap.set("n", "<F12>", dap.step_out)
            vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
            vim.keymap.set("n", "<leader>du", dapui.toggle)
        end,
    },
}
