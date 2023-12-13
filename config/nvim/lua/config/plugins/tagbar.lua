-- Open tag navigation split with :Tagbar
return {
  "preservim/tagbar",
  init = function()
    vim.g.tagbar_autofocus = 1
    vim.g.tagbar_show_data_type = 1
    vim.g.tagbar_iconchars = { "", "" }

    vim.keymap.set("n", "<F8>", "<cmd>TagbarToggle fjc<CR>", { desc = "Toggle tagbar" })
  end
}
