local M = {
    "mfussenegger/nvim-dap",
    dependencies = {
        {
            "rcarriga/nvim-dap-ui",

            config = function()
                require("dapui").setup()
            end,
        },
    { "theHamsta/nvim-dap-virtual-text" },
        { "mfussenegger/nvim-dap-python" },
        { "leoluz/nvim-dap-go" }
    },
}

function M.init()
    vim.keymap.set("n", "<leader>b", function()
        require("dap").toggle_breakpoint()
    end, { desc = "Toggle Breakpoint" })

    vim.keymap.set('n', "<leader>B", function()
        require("dap").set_breakpoint(vim.fn.input "[DAP] Condition > ")
    end)
    vim.keymap.set("n", "<F5>", function()
        require("dap").continue()
    end, { desc = "Continue" })

    vim.keymap.set("n", "<F4>", function()
        require("dap").step_over()
    end, { desc = "Step Over" })

    vim.keymap.set("n", "<F3>", function()
        require("dap").step_into()
    end, { desc = "Step Into" })

    vim.keymap.set("n", "<F2>", function()
        require("dap").step_out()
    end, { desc = "Step Out" })

    vim.keymap.set("n", "<leader>dw", function()
        require("dap.ui.widgets").hover()
    end, { desc = "Widgets" })

    vim.keymap.set("n", "<leader>du", function()
        require("dapui").toggle({})
    end, { desc = "Dap UI" })

    -- vim.keymap.set("n", "<leader>ds", function()
    --     require("osv").launch({ port = 8086 })
    -- end, { desc = "Launch Lua Debugger Server" })
    --
    -- vim.keymap.set("n", "<leader>dd", function()
    --     require("osv").run_this()
    -- end, { desc = "Launch Lua Debugger" })

    vim.keymap.set('n', "<leader>de", require("dapui").eval, { desc = "Dap Eval" })

    vim.keymap.set('n', "<leader>dr", require("dap").repl.open, { desc = "Open Repl" })

    vim.keymap.set('n', "<leader>dE", function()
        require("dapui").eval(vim.fn.input "[DAP] Expression > ")
    end, { desc = "Dap Expression" })
    local dap = require("dap")

    require('nvim-dap-virtual-text').setup()


    require("dap-python").setup("python", {
        -- So if configured correctly, this will open up new terminal.
        --    Could probably get this to target a particular terminal
        --    and/or add a tab to kitty or something like that as well.

        include_configs = true,
    })

    require("dap-go").setup()

    -- dap.configurations.lua = {
    --     {
    --         type = "nlua",
    --         request = "attach",
    --         name = "Attach to running Neovim instance",
    --     },
    -- }

    local dapui = require("dapui")
    dap.adapters.nlua = function(callback, config)
        callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
    end
    dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open({})
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close({})
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close({})
    end
end

-- function M.config()
-- end

-- - `DapBreakpoint` for breakpoints (default: `B`)
-- - `DapBreakpointCondition` for conditional breakpoints (default: `C`)
-- - `DapLogPoint` for log points (default: `L`)
-- - `DapStopped` to indicate where the debugee is stopped (default: `→`)
-- - `DapBreakpointRejected` to indicate breakpoints rejected by the debug
--   adapter (default: `R`)
--
-- You can customize the signs by setting them with the |sign_define()| function.
-- For example:
--
-- >
--     lua << EOF
--     vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
--     EOF
-- <

return M
