local M = {
    enabled = false,
    "kdheepak/tabline.nvim",
    dependencies = {
        'kyazdani42/nvim-web-devicons'
    }
}


function M.config()
    require 'tabline'.setup {
        options = {
            show_filename_only = true,
            modified_italic    = false,
        } }
end

return M
