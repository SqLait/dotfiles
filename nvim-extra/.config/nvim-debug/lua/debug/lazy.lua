local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", --latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { import = "debug.plugins.lsp" },
    { import = "debug.plugins.ui" },
    { import = "debug.plugins.syntax" },
    { import = "debug.plugins.completion"},
    { import = "debug.plugins.misc" },
},

    {
        --defaults = { lazy = true },
        checker = {
            enabled = true,
            notify = false,
        },
        change_detection = {
            notify = false,
        },
        ui = {
            icons = {
                ft = "",
                lazy = "󰂠 ",
                loaded = "",
                not_loaded = "",
            },
        },
    })
