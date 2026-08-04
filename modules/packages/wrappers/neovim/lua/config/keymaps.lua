-- lua/config/keymaps.lua

local map = vim.keymap.set

---------------------------------------------------------------------------
-- Normal
---------------------------------------------------------------------------

-- Files / session
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Write file" })
map("n", "<leader>W", "<cmd>wa<cr>", { desc = "Write all files" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<leader>Q", "<cmd>qa!<cr>", { desc = "Quit all (force)" })
map("n", "<leader>x", "<cmd>x<cr>", { desc = "Write and quit" })

-- Editing quality-of-life
map("n", "J", "mzJ`z", { desc = "Join lines (keep cursor)" })
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down (center)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up (center)" })
map("n", "n", "nzzzv", { desc = "Next search (center)" })
map("n", "N", "Nzzzv", { desc = "Prev search (center)" })
map({ "n", "x" }, "{", "{zz", { desc = "Prev paragraph (center)" })
map({ "n", "x" }, "}", "}zz", { desc = "Next paragraph (center)" })
map("n", "Q", "<nop>", { desc = "Disable Ex mode" })
map("n", "U", "<C-r>", { desc = "Redo" })
map("n", "L", "$", { desc = "End of line" })
map("n", "H", "^", { desc = "Start of line" })

map("n", "<leader>no", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })

-- Clipboard / registers
map("n", "<leader>Y", '"+Y', { desc = "Yank line to +" })
map({ "n", "x" }, "<leader>y", '"+y', { desc = "Yank to +" })
map({ "n", "x" }, "<leader>d", '"_d', { desc = "Delete to void" })
map("n", "<leader>p", '"+p', { desc = "Paste from +" })
map("n", "<leader>P", '"+P', { desc = "Paste before from +" })

-- Substitute word under cursor
map(
  "n",
  "S",
  ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
  { desc = "Substitute word under cursor" }
)

-- Quickfix
map("n", "<leader>ld", vim.diagnostic.setqflist, { desc = "Diagnostics → qflist" })

map("n", "<leader>cn", "<cmd>cnext<cr>zz", { desc = "Next qflist item" })
map("n", "<leader>cp", "<cmd>cprevious<cr>zz", { desc = "Prev qflist item" })
map("n", "<leader>co", "<cmd>copen<cr>", { desc = "Open qflist" })
map("n", "<leader>cc", "<cmd>cclose<cr>", { desc = "Close qflist" })

-- Location list
map("n", "<leader>ln", "<cmd>lnext<cr>zz", { desc = "Next loclist item" })
map("n", "<leader>lp", "<cmd>lprevious<cr>zz", { desc = "Prev loclist item" })
map("n", "<leader>lo", "<cmd>lopen<cr>", { desc = "Open loclist" })
map("n", "<leader>lc", "<cmd>lclose<cr>", { desc = "Close loclist" })

-- Windows
map("n", "<C-h>", "<C-w>h", { desc = "Window left" })
map("n", "<C-j>", "<C-w>j", { desc = "Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window up" })
map("n", "<C-l>", "<C-w>l", { desc = "Window right" })
map("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "Split vertical" })
map("n", "<leader>sh", "<cmd>split<cr>", { desc = "Split horizontal" })
map("n", "<leader>se", "<C-w>=", { desc = "Equalize splits" })
map("n", "<leader>sx", "<cmd>close<cr>", { desc = "Close split" })
map("n", "<leader>so", "<C-w>o", { desc = "Only this window" })

-- Resize splits
map("n", "<M-h>", "<cmd>vertical resize -2<cr>", { desc = "Narrow window" })
map("n", "<M-l>", "<cmd>vertical resize +2<cr>", { desc = "Widen window" })
map("n", "<M-k>", "<cmd>resize -2<cr>", { desc = "Taller window" })
map("n", "<M-j>", "<cmd>resize +2<cr>", { desc = "Shorter window" })

-- Buffers
map("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Alternate buffer" })

-- -- Move lines in normal mode
-- map("n", "<M-j>", ":m .+1<cr>==", { desc = "Move line down" })
-- map("n", "<M-k>", ":m .-2<cr>==", { desc = "Move line up" })

-- Select last pasted / changed text
map("n", "gp", "`[v`]", { desc = "Select last paste" })

-- Better indent in normal (optional muscle memory)
map("n", ">", ">>", { desc = "Indent line" })
map("n", "<", "<<", { desc = "Outdent line" })

---------------------------------------------------------------------------
-- Insert → Normal
---------------------------------------------------------------------------

-- <C-^> returns to normal mode (same as Esc), not only "stop insert"
map("i", "<C-^>", "<Esc>", { desc = "Return to normal mode" })

-- Optional extras while in insert
map("i", "<C-h>", "<C-w>", { desc = "Delete word backward" }) -- if you like readline-style

---------------------------------------------------------------------------
-- Visual / select
---------------------------------------------------------------------------

map("x", "<M-j>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
map("x", "<M-k>", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })

map("x", "<leader>P", '"_dP', { desc = "Paste without clobbering register" })
map("x", "<leader>y", '"+y', { desc = "Yank selection to +" })
map("x", "<leader>d", '"_d', { desc = "Delete selection to void" })

map("x", ">>", function()
  vim.cmd("normal! >>")
  vim.cmd("normal! gv")
end, { desc = "Indent (keep selection)" })

map("x", "<<", function()
  vim.cmd("normal! <<")
  vim.cmd("normal! gv")
end, { desc = "Outdent (keep selection)" })

-- Keep your old "disable Esc in insert/visual" only if you still want it.
-- With <C-^> → <Esc>, you probably want Esc working again:
-- map({ "i", "x" }, "<Esc>", "<nop>")
