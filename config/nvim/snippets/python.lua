local ls = require("luasnip")

local c = ls.choice_node
local f = ls.function_node
local i = ls.insert_node
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node

local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
	s(
		{ trig = "#!", dscr = "python shebang" },
		fmta(
			[[
      #!/usr/bin/env python
      ]],
      {}
		),
		{ condition = line_begin }
	),

	-- Control flow
	s(
		{ trig = "class", dscr = "Class" },
		fmta(
			[[
      class <>():
          """<>."""

          def __init__(self, <>):
              <>
      ]],
			{ i(1, "Name"), i(2, "docstring"), i(3, "arg"), i(4, "attr") }
		),
		{ condition = line_begin }
	),
	s(
		{ trig = "def", dscr = "Function" },
		fmta(
			[[
      def <>(<>):
          """<>."""
          <>
      ]],
			{ i(1, "func_name"), i(2, "args"), i(3, "docstring"), i(4) }
		),
		{ condition = line_begin }
	),
	s(
		{ trig = "dec", dscr = "Decorator" },
		fmta(
			[[
      def <>(<>):
          @wraps(func)
          def <>(<>):
              <>

          return <>
      ]],
			{
				i(1, "decorator_name"),
				i(2, "func"),
				i(3, "wrapper"),
				i(4, "*args, **kwargs"),
				i(5),
				rep(3),
			}
		),
		{ condition = line_begin }
	),
	s(
		{ trig = "im", dscr = "If main" },
		fmta(
			[[
         if __name__ == '__main__':
              <>
      ]],
			{ i(0) }
		),
		{ condition = line_begin }
	),

	-- Logging, debugging and docstrings
	s(
		{ trig = "bl", dscr = "Basic logger" },
		fmta(
			[[
      logging.basicConfig(level=logging.<>)
      ]],
			{ i(1, "DEBUG") }
		),
		{ condition = line_begin }
	),
	s(
		{ trig = "li", dscr = "Logger info" },
		fmta(
			[[
      logger.<>(<><>)
      ]],
			{
				c(1, { t("info"), t("error"), t("debug") }),
				f(_G.LuaSnipConfig.visual_selection),
				i(2),
			}
		),
		{ condition = line_begin }
	),
	s(
		{ trig = "bp", dscr = "Breakpoint" },
		fmta(
			[[
      breakpoint()
      ]],
			{}
		)
	),

	---- Datetime
	s(
		{ trig = "fdt", dscr = "From datetime" },
		fmta(
			[[
      from datetime import datetime
      ]],
			{}
		),
		{ condition = line_begin }
	),

	---- pytest
	s(
		{ trig = "ptf", dscr = "Pytest fixture" },
		fmta(
			[[
            @pytest.fixture
            def <>(<>):
                <>
        ]],
			{ i(1, "f"), i(2), i(3) }
		),
		{ condition = line_begin }
	),

	-- Miscellaneous
	s(
		{ trig = "pri", dscr = "print" },
		fmta(
			[[
      print(<><>)
      ]],
			{ f(_G.LuaSnipConfig.visual_selection), i(1) }
		)
	),
	s(
		{ trig = "fs", dscr = "f-string" },
		fmta(
			[[
      f'<><>'
      ]],
			{ f(_G.LuaSnipConfig.visual_selection), i(1) }
		)
	),
	s(
		{ trig = "wo", dscr = "With open" },
		fmta(
			[[
      with open(<>, '<>') as <>:
          <>
      ]],
			{ i(1, "filepath"), i(2, "r"), i(3, "f"), i(4) }
		),
		{ condition = line_begin }
	),
}, {
	s({ trig = "tq", dscr = "Triple quotes" }, {
		t('"""'),
		f(_G.LuaSnipConfig.visual_selection),
		i(1),
		t('"""'),
		i(0),
	}),
	s(
		{ trig = "fq", dscr = "f-string quote" },
		fmta(
			[[
      f<><><><>
      ]],
			{
				c(1, { sn(nil, { i(1, '"') }), t("'") }),
				f(_G.LuaSnipConfig.visual_selection),
				i(2),
				rep(1),
			}
		),
		{ condition = line_begin }
	),
	s({ trig = "--", wordTrig = false, dscr = "Return" }, {
		t("->"),
		i(1),
	}),
}
