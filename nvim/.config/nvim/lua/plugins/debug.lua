return {
    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")

            -- LLDB adapter
            dap.adapters.lldb = {
                type = "executable",
                command = "lldb-dap", -- or "lldb-dap" on some systems
                name = "lldb",
            }

            -- Zig configuration
            dap.configurations.zig = {
                {
                    name = "Debug Zig",
                    type = "lldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input(
                            "Path to executable: ",
                            vim.fn.getcwd() .. "/zig-out/bin/",
                            "file"
                        )
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                    args = {},
                },
            }

            -- Keymaps
            local map = vim.keymap.set
            map("n", "<F5>", dap.continue, { desc = "DAP Continue" })
            map("n", "<F10>", dap.step_over, { desc = "DAP Step Over" })
            map("n", "<F11>", dap.step_into, { desc = "DAP Step Into" })
            map("n", "<F12>", dap.step_out, { desc = "DAP Step Out" })
            map("n", "<leader>bk", dap.toggle_breakpoint, { desc = "DAP Toggle Breakpoint" })
            map("n", "<leader>dr", dap.repl.open, { desc = "DAP REPL" })
        end,
    },

    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        config = function()
            local dap, dapui = require("dap"), require("dapui")

            dapui.setup()

            dap.listeners.after.event_initialized["dapui"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui"] = function()
                dapui.close()
            end
        end,
    },
}
