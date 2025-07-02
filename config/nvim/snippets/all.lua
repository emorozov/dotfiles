local ls = require("luasnip")

local s = ls.snippet
local f = ls.function_node

return {
  -- Autosnippets
  s(
    {trig = 'cdate', desc = "Insert current date", snippetType = "autosnippet"},
    {f(function()
      return vim.fn.strftime("%Y-%m-%d")
    end)}
  ),
}
