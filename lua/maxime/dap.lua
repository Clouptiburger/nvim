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

local dap_python = require "dap-python"
require('dap-go').setup()

dap_python.setup("python", {
    -- So if configured correctly, this will open up new terminal.
    --    Could probably get this to target a particular terminal
    --    and/or add a tab to kitty or something like that as well.

    include_configs = true,
})

require('dapui').setup()

local dap, dapui = require('dap'), require('dapui')
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
