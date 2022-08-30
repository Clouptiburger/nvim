local action_state = require "telescope.actions.state"
return function ()
    local opts

    opts = {
        sorting_strategy = "ascending",
        scroll_strategy = "cycle",
        layout_config = {
            prompt_position = "top",
        },

        attach_mappings = function(prompt_bufnr, map)
            local current_picker = action_state.get_current_picker(prompt_bufnr)

            local modify_cwd = function(new_cwd)
                local finder = current_picker.finder

                finder.path = new_cwd
                finder.files = true
                current_picker:refresh(false, { reset_prompt = true })
            end

            map("i", "-", function()
                modify_cwd(current_picker.cwd .. "/..")
            end)

            map("i", "~", function()
                modify_cwd(vim.fn.expand "~")
            end)

            -- local modify_depth = function(mod)
            --   return function()
            --     opts.depth = opts.depth + mod
            --
            --     current_picker:refresh(false, { reset_prompt = true })
            --   end
            -- end
            --
            -- map("i", "<M-=>", modify_depth(1))
            -- map("i", "<M-+>", modify_depth(-1))

            map("n", "yy", function()
                local entry = action_state.get_selected_entry()
                vim.fn.setreg("+", entry.value)
            end)

            return true
        end,
    }

    require("telescope").extensions.file_browser.file_browser(opts)
end
