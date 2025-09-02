return {
    --[[{
        'rcarriga/nvim-dap-ui',
        event = 'VeryLazy',
        dependencies = {
            'mfussenegger/nvim-dap',
            'nvim-neotest/nvim-nio'
        },
        config = function()
            local dap = require('dap')
            local dapui = require('dapui')
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function ()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end


            local keymap = vim.keymap
            keymap.set("n", "<space>tb", dap.toggle_breakpoint)
            keymap.set("n", "<space>gb", dap.run_to_cursor)

            --Eval var under cursor
            keymap.set("n", "<space>?", function()
                require("dapui").eval(nil, { enter = true })
            end)

            keymap.set("n", "<F1>", dap.continue)
            keymap.set("n", "<F2>", dap.step_into)
            keymap.set("n", "<F3>", dap.step_over)
            keymap.set("n", "<F4>", dap.step_out)
            keymap.set("n", "<F5>", dap.step_back)
            keymap.set("n", "<F6>", dap.close)
            keymap.set("n", "<F7>", dap.disconnect)
            keymap.set("n", "<F12>", dap.restart)

            keymap.set({'n', 'v'}, '<Leader>dp', function()
                require('dap.ui.widgets').preview()
            end)
        end
    },
    {
        'mfussenegger/nvim-dap'
    },
    {
        'jay-babu/mason-nvim-dap.nvim',
        event = "VeryLazy",
        dependencies = {
            'mfussenegger/nvim-dap',
            "williamboman/mason.nvim",
        },
        opts = {
            handlers = {},
        }
    }]]
}
