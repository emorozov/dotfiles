return {
  "f-person/git-blame.nvim",
  event = { "BufReadPre" },
  config = function()
      vim.g.tagbar_autofocus = 1
      vim.g.tagbar_show_data_type = 1
  end,
}
