return {
    "mcauley-penney/tidy.nvim",
    opts = {
        enabled_on_save = false,
        filetype_exclude = { "markdown", "diff" }
    },
    init = function()
        vim.keymap.set('n', "<leader>tt", require("tidy").toggle, { desc = "Toggle tidy whitespace" })
        vim.keymap.set('n', "<leader>tr", require("tidy").run, { desc = "Tidy up whitespace" })
    end
}
