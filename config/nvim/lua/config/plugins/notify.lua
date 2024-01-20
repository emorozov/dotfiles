return {
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	config = function()
		local n = require("notify")
		n.setup({
			top_down = false,
			render = "minimal",
		})
		vim.notify = n
	end,
}
