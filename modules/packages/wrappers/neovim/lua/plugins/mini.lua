-- mini.nvim modules (from your NVF config)

--- Show harpoon marks; current file is wrapped in [].
--- Place after "%=" and before fileinfo so it sits far right, left of fileinfo.
local function section_harpoon(opts)
  opts = opts or {}
  local trunc = opts.trunc_width or 0
  if vim.o.columns < trunc then
    return ""
  end

  local ok, harpoon = pcall(require, "harpoon")
  if not ok then
    return ""
  end

  local list = harpoon:list()
  local n = list:length()
  if n == 0 then
    return ""
  end

  local current = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":p")
  local parts = {}

  for i = 1, n do
    local item = list:get(i)
    if item and item.value then
      local path = vim.fn.fnamemodify(item.value, ":p")
      local label = tostring(i)
      if path == current then
        label = "[" .. i .. "]"
      end
      table.insert(parts, label)
    end
  end

  if #parts == 0 then
    return ""
  end

  local icon = vim.g.miniicons_style == "glyph" and "󰛢 " or "H "
  return icon .. table.concat(parts, " ")
end

require("mini.surround").setup({
  mappings = {
    add = "sa",
    delete = "sd",
    find = "sf",
    find_left = "sF",
    highlight = "sh",
    replace = "sr",
    update_n_lines = "sn",
  },
  search_method = "cover_or_next",
})

require("mini.pairs").setup()

require("mini.clue").setup({
  triggers = {
    -- Leader
    { mode = "n", keys = "<Leader>" },
    { mode = "x", keys = "<Leader>" },

    -- Builtin completion
    { mode = "i", keys = "<C-x>" },

    -- g
    { mode = "n", keys = "g" },
    { mode = "x", keys = "g" },

    -- Marks
    { mode = "n", keys = "'" },
    { mode = "n", keys = "`" },
    { mode = "x", keys = "'" },
    { mode = "x", keys = "`" },

    -- Registers
    { mode = "n", keys = '"' },
    { mode = "x", keys = '"' },
    { mode = "i", keys = "<C-r>" },
    { mode = "c", keys = "<C-r>" },

    -- Windows
    { mode = "n", keys = "<C-w>" },

    -- z
    { mode = "n", keys = "z" },
    { mode = "x", keys = "z" },
  },
})

require("mini.comment").setup({
  mappings = {
    comment = "gc",
    comment_line = "gcc",
    comment_visual = "gc",
    textobject = "gc",
  },
})

require("mini.statusline").setup({
  use_icons = true,
  content = {
    active = function()
      local git = MiniStatusline.section_git({ trunc_width = 75 })
      local diff = MiniStatusline.section_diff({ trunc_width = 74 })
      local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
      local filename = MiniStatusline.section_filename({ trunc_width = 140 })
      local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
      local harpoon = section_harpoon({ trunc_width = 100 })

      return MiniStatusline.combine_groups({
        { hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics } },
        "%<",
        { hl = "MiniStatuslineFilename", strings = { filename } },
        "%=",
        { hl = "MiniStatuslineFilename", strings = { harpoon } },
        { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
      })
    end,
  },
})

require("mini.git").setup()
require("mini.diff").setup()

require("mini.cursorword").setup({
  delay = 100,
})

local hipatterns = require("mini.hipatterns")
hipatterns.setup({
  highlighters = {
    hex_color = hipatterns.gen_highlighter.hex_color(),
    todo = { pattern = "%f[%w]()TODO%f[%W]", group = "MiniHipatternsTodo" },
  },
})

require("mini.icons").setup({
  style = "glyph",
})

-- Optional but recommended so other plugins can use mini.icons
-- package.preload["nvim-web-devicons"] = function()
--   require("mini.icons").mock_nvim_web_devicons()
--   return package.loaded["nvim-web-devicons"]
-- end

require("mini.indentscope").setup({
  symbol = "│", -- "|" also works; box-drawing looks cleaner
  options = {
    try_as_border = true,
  },
})
