local ls = require("luasnip")
local types = require "luasnip.util.types"
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local extras = require("luasnip.extras")
local m = extras.m
local l = extras.l
local rep = extras.rep
local postfix = require("luasnip.extras.postfix").postfix

ls.config.set_config {
    -- This tells LuaSnip to remember to keep around the last snippet.
    -- You can jump back into it even if you move outside of the selection
    history = true,

    -- This one is cool cause if you have dynamic snippets, it updates as you type!
    updateevents = "TextChanged,TextChangedI",

    -- Autosnippets:
    enable_autosnippets = true,

    -- Crazy highlights!!
    -- #vid3
    -- ext_opts = nil,
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { " « ", "NonTest" } },
            },
        },
    },
}

ls.add_snippets("python", {
    s("main", {
        t({ 'if __name__ == "__main__":', "    " }),
        i(1)
    })
})
ls.add_snippets("all", {
    -- date -> Tue 16 Nov 2021 09:43:49 AM EST
    s({ trig = "date" }, {
        f(function()
            -- return string.format(string.gsub(vim.bo.commentstring, "%%s", " %%s"), os.date())
            return string.format(os.date())
        end, {}),
    })
})

ls.add_snippets("html", {
    s("html:5", {
        t({ [[<!DOCTYPE html>]], "" }),
        t({ [[<html lang="en">]], "\t" }),
        t({ [[<head>]], "\t\t" }),
        t({ [[<meta charset="UTF-8">]], "\t\t" }),
        t({ [[<meta http-equiv="X-UA-Compatible" content="IE=edge">]], "\t\t" }),
        t({ [[<meta name="viewport" content="width=device-width, initial-scale=1.0">]], "\t\t" }),
        t({ [[<title>Document</title>]], "\t\t" }),
        t({ [[</head>]], "\t" }),

        t({ [[<body>]] }),
        i(1),
        t({ [[</body>]], "" }),
        t({ [[</html>]] }),
    })
})
