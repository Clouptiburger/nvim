local M = {
    enabled = true,
    "rebelot/kanagawa.nvim",
    { "ellisonleao/gruvbox.nvim",    priority = 1000, config = true, opts = ... },
    { 'kepano/flexoki-neovim',       name = 'flexoki' },
    { "eldritch-theme/eldritch.nvim" },
    {
        "scottmckendry/cyberdream.nvim",
        lazy = false,
        priority = 1000,
    },
    { 'projekt0n/github-nvim-theme' },
    { 'Mofiqul/vscode.nvim' },
    { 'marko-cerovac/material.nvim' },
    { 'Mofiqul/dracula.nvim' },
}


return M
