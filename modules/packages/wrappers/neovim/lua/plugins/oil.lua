local oil = require("oil")

local detail = false

oil.setup({
  columns = { "icon" },
  use_default_keymaps = false,
  view_options = {
    show_hidden = true,
  },
  keymaps = {
    ["g?"] = { "actions.show_help", mode = "n" },
    ["<CR>"] = "actions.select",
    ["<C-p>"] = "actions.preview",
    ["<C-c>"] = { "actions.close", mode = "n" },
    ["<C-l>"] = "actions.refresh",
    ["<BS>"] = { "actions.parent", mode = "n" },
    ["<A-BS>"] = { "actions.open_cwd", mode = "n" },
    ["g."] = { "actions.toggle_hidden", mode = "n" },
    ["gd"] = {
      desc = "Toggle file detail view",
      callback = function()
        detail = not detail
        if detail then
          oil.set_columns({ "icon", "permissions", "size", "mtime" })
        else
          oil.set_columns({ "icon" })
        end
      end,
    },
  },
})

vim.keymap.set("n", "<leader>pv", oil.open, { desc = "Open oil file explorer" })
