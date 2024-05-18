local M = {
    -- Adds git related signs to the gutter, as well as utilities for managing changes

    'lewis6991/gitsigns.nvim',
}
function M.config()
    require("gitsigns").setup(
        {
            numhl = true,
        }
    )
end

return M
