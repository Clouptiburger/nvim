return {
    'norcalli/nvim-colorizer.lua',
    event = "BufReadPre",
    enabled = false,
    opts = {
        filetypes = { "*", "!lazy" },
        buftype = { "*", "!prompt", "!nofile" },
        user_default_options = {
            RGB = true,       -- #RGB hex codes
            RRGGBB = true,    -- #RRGGBB hex codes
            names = false,    -- "Name" codes like Blue
            RRGGBBAA = true,  -- #RRGGBBAA hex codes
            AARRGGBB = false, -- 0xAARRGGBB hex codes
            rgb_fn = true,    -- CSS rgb() and rgba() functions
            hsl_fn = true,    -- CSS hsl() and hsla() functions
            css = false,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
            css_fn = true,    -- Enable all CSS *functions*: rgb_fn, hsl_fn
            -- Available modes: foreground, background
            -- Available modes for `mode`: foreground, background,  virtualtext
            mode = "background", -- Set the display mode.
            virtualtext = "■",
        },
    },
    -- better diffing
    {
        "sindrets/diffview.nvim",
        cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
        config = true,
        keys = { { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "DiffView" } },
    },
    -- markdown preview
    -- doesn't seem to work for now :(
    {
        "toppair/peek.nvim",
        enabled = false,
        build = "deno task --quiet build:fast",
        keys = {
            {
                "<leader>md",
                function()
                    local peek = require("peek")
                    if peek.is_open() then
                        peek.close()
                    else
                        peek.open()
                    end
                end,
                desc = "Peek (Markdown Preview)",
            },
        },
        opts = {
            theme = "light",
            -- app = "browser"
        },
    },
}
