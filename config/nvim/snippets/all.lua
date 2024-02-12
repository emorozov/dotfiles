local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
	-- Autosnippets
	---- Autopairs
	s({ trig = "dq", dscr = "Double quotes" }, {
		t('"'),
		f(_G.LuaSnipConfig.visual_selection),
		i(1),
		t('"'),
		i(0),
	}),
	s({ trig = "sq", dscr = "Single quotes" }, {
		t("'"),
		f(_G.LuaSnipConfig.visual_selection),
		i(1),
		t("'"),
		i(0),
	}),
	s({ trig = "{{", wordTrig = false, dscr = "Braces" }, {
		t("{"),
		f(_G.LuaSnipConfig.visual_selection),
		i(1),
		t("}"),
		i(0),
	}),
	s({ trig = "((", wordTrig = false, dscr = "Parenthesis" }, {
		t("("),
		f(_G.LuaSnipConfig.visual_selection),
		i(1),
		t(")"),
		i(0),
	}),
	s({ trig = "[[", wordTrig = false, dscr = "Brackets" }, {
		t("["),
		f(_G.LuaSnipConfig.visual_selection),
		i(1),
		t("]"),
		i(0),
	}),
	s({ trig = "<<", wordTrig = false, dscr = "<>" }, {
		t("<"),
		f(_G.LuaSnipConfig.visual_selection),
		i(1),
		t(">"),
		i(0),
	}),
}
