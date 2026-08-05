local harpoon = require("harpoon")

harpoon:setup({
	settings = {
		save_on_toggle = true,
		sync_on_ui_close = true,
	},
})

local list = function()
	return harpoon:list()
end

-- Mark / list (from your NVF mappings)
vim.keymap.set("n", "<leader>ha", function()
	list():add()
end, { desc = "Harpoon add file" })

vim.keymap.set("n", "<leader>ho", function()
	harpoon.ui:toggle_quick_menu(list())
end, { desc = "Harpoon list marks" })

-- Quick select file1–4
vim.keymap.set("n", "<A-y>", function()
	list():select(1)
end, { desc = "Harpoon file 1" })

vim.keymap.set("n", "<A-u>", function()
	list():select(2)
end, { desc = "Harpoon file 2" })

vim.keymap.set("n", "<A-i>", function()
	list():select(3)
end, { desc = "Harpoon file 3" })

vim.keymap.set("n", "<A-o>", function()
	list():select(4)
end, { desc = "Harpoon file 4" })

-- Optional extras (not in your NVF config)
vim.keymap.set("n", "<leader>hn", function()
	list():next()
end, { desc = "Harpoon next" })

vim.keymap.set("n", "<leader>hp", function()
	list():prev()
end, { desc = "Harpoon prev" })
