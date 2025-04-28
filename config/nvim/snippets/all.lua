local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node

return {
  -- Autosnippets
  s(
    {trig = 'cdate', desc = "Insert current date", snippetType = "autosnippet"},
    {t(vim.fn.strftime("%Y-%m-%d"))}
  ),
}
