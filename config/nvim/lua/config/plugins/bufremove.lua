return {
  "echasnovski/mini.bufremove",
  lazy = true,
  keys = {
    {
      "<leader>bd",
      function()
        require("mini.bufremove").delete(0, false)
      end,
      desc = "Delete Buffer",
    },
  },
}
