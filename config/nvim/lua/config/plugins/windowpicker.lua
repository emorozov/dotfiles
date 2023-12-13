return {
  "s1n7ax/nvim-window-picker",
  event = "VeryLazy",
  keys = function(_, keys)
    local pick_window = function()
      local picked_window_id = require("window-picker").pick_window()
      if picked_window_id ~= nil then
        vim.api.nvim_set_current_win(picked_window_id)
      end
    end

    local swap_window = function()
      local picked_window_id = require("window-picker").pick_window()
      if picked_window_id ~= nil then
        local current_winnr = vim.api.nvim_get_current_win()
        local current_bufnr = vim.api.nvim_get_current_buf()
        local other_bufnr = vim.api.nvim_win_get_buf(picked_window_id)
        vim.api.nvim_win_set_buf(current_winnr, other_bufnr)
        vim.api.nvim_win_set_buf(picked_window_id, current_bufnr)
      end
    end

    local mappings = {
      { "<leader>-", pick_window, desc = "Pick window" },
      { "<leader>pw", swap_window, desc = "Swap picked window" },
    }
    return vim.list_extend(mappings, keys)
  end,
  opts = {
    hint = "floating-big-letter",
    show_prompt = false,
    filter_rules = {
      include_current_win = true,
      bo = {
        filetype = { "notify", "noice" },
        buftype = {},
      },
    },
  },
}
