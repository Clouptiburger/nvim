local ok, neogit = pcall(require, "neogit")
if not ok then
    return
end


neogit.setup {
    integrations = {
        diffview = true,
    },
}

vim.keymap.set('n', '<leader>gd', ':DiffviewOpen<CR>')
vim.keymap.set('n', '<leader>gs', neogit.open)
vim.keymap.set('n', '<leader>gc', function()
    neogit.open { "commit" }
end
)
