local M = {
    "echasnovski/mini.nvim",
    version = false,
}

function M.surround()
    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require("mini.surround").setup()
end

function M.jump()
    require("mini.jump").setup()
end

function M.pairs()
    require("mini.pairs").setup()
end

function M.bracketed()
    require("mini.bracketed").setup()
end

function M.comment()
    require("mini.comment").setup({
    })
end

function M.move()
    require("mini.move").setup()
end

function M.ai()
    local ai = require("mini.ai")
    require("mini.ai").setup({
        n_lines = 500,
        -- search_method = "cover_or_next",
        custom_textobjects = {
            o = ai.gen_spec.treesitter({
                a = { "@block.outer", "@conditional.outer", "@loop.outer" },
                i = { "@block.inner", "@conditional.inner", "@loop.inner" },
            }, {}),
            f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
            c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
        },
    })

    local map = function(text_obj, desc)
        for _, side in ipairs({ "left", "right" }) do
            for dir, d in pairs({ prev = "[", next = "]" }) do
                local lhs = d .. (side == "right" and text_obj:upper() or text_obj:lower())
                for _, mode in ipairs({ "n", "x", "o" }) do
                    vim.keymap.set(mode, lhs, function()
                        ai.move_cursor(side, "a", text_obj, { search_method = dir })
                    end, {
                        desc = dir .. " " .. desc,
                    })
                end
            end
        end
    end

    map("f", "function")
    map("c", "class")
    map("o", "block")
end

function M.statusLine()
    -- Simple and easy statusline.
    --  You could remove this setup call if you don't like it,
    --  and try some other statusline plugin
    local statusline = require 'mini.statusline'
    statusline.setup()

end

function M.config()
    M.jump()
    M.surround()
    -- M.ai()
    M.pairs()
    M.move()
    M.comment()
    M.bracketed()
    M.statusLine()
end

function M.init()
    vim.keymap.set("n", "<leader>bd", function()
        require("mini.bufremove").delete(0, false)
    end)
    vim.keymap.set("n", "<leader>bD", function()
        require("mini.bufremove").delete(0, true)
    end)
end

return M
