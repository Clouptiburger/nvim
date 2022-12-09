vim.keymap.set('n', '<F5>', require('dap').continue)
vim.keymap.set('n', '<F1>', require('dap').step_back)
vim.keymap.set('n', '<F2>', require('dap').step_into)
vim.keymap.set('n', '<F3>', require('dap').step_over)
vim.keymap.set('n', '<F4>', require('dap').step_out)
vim.keymap.set('n', '<leader>b', require('dap').toggle_breakpoint)
vim.keymap.set('n', "<leader>B", function()
    require("dap").set_breakpoint(vim.fn.input "[DAP] Condition > ")
end)
vim.keymap.set('n', "<leader>de", require("dapui").eval)
vim.keymap.set('n', "<leader>dr", require("dap").repl.open)
vim.keymap.set('n', "<leader>dE", function()
    require("dapui").eval(vim.fn.input "[DAP] Expression > ")
end)
require('nvim-dap-virtual-text').setup()

local dap, dapui = require('dap'), require('dapui')
local dap_python = require "dap-python"
require('dap-go').setup()

dap_python.setup("python", {
    -- So if configured correctly, this will open up new terminal.
    --    Could probably get this to target a particular terminal
    --    and/or add a tab to kitty or something like that as well.

    include_configs = true,
})

-- dap.adapters.codelldb = {
--     type = 'server',
--     port = "${port}",
--     executable = {
--         -- CHANGE THIS to your path!
--         command = vim.env.HOME .. "\\.vscode\\extensions\\vadimcn.vscode-lldb-1.8.1\\adapter\\codelldb.exe",
--         args = { "--port", "${port}" },
--
--         -- On windows you may have to uncomment this:
--         -- detached = false,
--     }
-- }
-- dap.configurations.cpp = {
--     {
--         name = "Launch file",
--         type = "codelldb",
--         request = "launch",
--         program = function()
--             return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--         end,
--         cwd = '${workspaceFolder}',
--         stopOnEntry = false,
--     },
-- }

-- dap.configurations.c = dap.configurations.cpp
-- dap.configurations.rust = dap.configurations.cpp

require('dapui').setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
