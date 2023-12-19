local formatters = {
  javascript = { "prettier" },
  json = { "prettier" },
  jsonc = { "prettier" },
  html = { "prettier" },
  yaml = { "prettier" },
  css = { "stylelint", "prettier" },
  sh = { "shellcheck", "shfmt" },
  lua = { "stylua" },
}

return {
  "stevearc/conform.nvim",
  lazy = true,
  opts = {
    formatters_by_ft = formatters,
  },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format()
      end,
      desc = "Format Buffer",
    },
  },
}
