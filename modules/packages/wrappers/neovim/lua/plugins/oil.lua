local oil = require("oil")

oil.setup({
  default_file_explorer = true,
  view_options = {
    show_hidden = true,
  },
})

vim.keymap.set("n", "<leader>pv", oil.open, { desc = "Open oil file explorer" })
