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
-- require('dap-python').setup(vim.fn.stdpath('data') .. "\\mason\\packages\\debugpy\\venv\\Scripts\\python")
require('dap-python').setup()
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
