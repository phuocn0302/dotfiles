--Load lazyvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local opts = {}

require("vim-opts")
--require("lazy").setup("plugins")
require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    checker = {
        enabled = true, -- automatically check for plugin updates
        notify = false, -- get a notification when new updates are found
    },

    -- ui config
    ui = {},
})
