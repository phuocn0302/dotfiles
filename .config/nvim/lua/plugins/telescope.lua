return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' },

        config = function()
        local builtin = require("telescope.builtin")
        vim.keymap.set('n', '<C-f>', builtin.find_files, {})
        vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})

        local telescope = require('telescope')
        telescope.setup {
            pickers = {find_files = {hidden = true}}
            }
        end,
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
        require("telescope").setup {
            extensions = {
                ["ui-select"] = {
                require("telescope.themes").get_dropdown {
                -- even more opts
                        }
                    }
                }
        }
        require("telescope").load_extension("ui-select")
        end,
    },
}

