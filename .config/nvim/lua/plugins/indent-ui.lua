return {
    { -- Ident guides
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {}, 
        config = function()
            require("ibl").setup{
                indent = {
                    char = "│",
                    tab_char = "│",
                },            
                scope = { enabled = false},
                exclude = {
                    filetypes = {
                    "help",
                    "alpha",
                    "dashboard",
                    "neo-tree",
                    "Trouble",
                    "trouble",
                    "lazy",
                    "mason",
                    "notify",
                    "toggleterm",
                    "lazyterm",
                    },
                },
            }
        end,
    },

    { -- Highlight and animate ident
        "echasnovski/mini.indentscope",
        version = false,
        config = function()
            local indentscope = require("mini.indentscope")
            indentscope.setup {
                symbol = "│",
                options = { try_as_border = true },
            }
        end,
        -- Disable indent for these file (take form Lazyvim)
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
            pattern = {
              "help",
              "alpha",
              "dashboard",
              "neo-tree",
              "Trouble",
              "trouble",
              "lazy",
              "mason",
              "notify",
              "toggleterm",
              "lazyterm",
            },
            callback = function()
            vim.b.miniindentscope_disable = true
            end,
            })
        end,
    },

}
