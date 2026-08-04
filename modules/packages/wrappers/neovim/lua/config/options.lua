-- lua/config/options.lua

-- Leaders (must be set before keymaps that use them)
vim.g.mapleader = " "
vim.g.maplocalleader = ","

---------------------------------------------------------------------------
-- Line numbers / cursor
---------------------------------------------------------------------------
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.cursorlineopt = "number" -- highlight number only (less noisy); use "both" if you prefer
vim.o.guicursor =
  "n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

---------------------------------------------------------------------------
-- UI
---------------------------------------------------------------------------
vim.o.showmode = false -- statusline / plugin usually shows mode
vim.o.showcmd = true
vim.o.cmdheight = 1
vim.o.laststatus = 3 -- global statusline
vim.o.termguicolors = true
vim.o.signcolumn = "yes"
vim.o.colorcolumn = "80"
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.wrap = false
vim.o.linebreak = true -- if wrap is on later, break on words
vim.o.smoothscroll = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.splitkeep = "screen"
vim.o.winminwidth = 5
vim.o.pumheight = 12 -- popup menu max height
vim.o.pumblend = 10 -- slight transparency if supported
vim.o.winblend = 0

vim.opt.list = true
vim.opt.listchars = {
  tab = "» ",
  trail = "·",
  nbsp = "␣",
  extends = "›",
  precedes = "‹",
}

vim.opt.fillchars = {
  eob = " ", -- hide ~ at end of buffer
  fold = " ",
  foldopen = "▾",
  foldclose = "▸",
  diff = "╱",
}

---------------------------------------------------------------------------
-- Indentation
---------------------------------------------------------------------------
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.breakindent = true
vim.o.shiftround = true -- round indent to multiple of shiftwidth

---------------------------------------------------------------------------
-- Files / backups / undo
---------------------------------------------------------------------------
vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.undofile = true
vim.o.undodir = (os.getenv("HOME") or "") .. "/.vim/undodir"
vim.o.confirm = true -- prompt instead of failing on unsaved quit
vim.o.autoread = true -- reload if file changed outside

---------------------------------------------------------------------------
-- Search
---------------------------------------------------------------------------
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.inccommand = "split" -- live preview :s in a split

---------------------------------------------------------------------------
-- Timing / completion / input
---------------------------------------------------------------------------
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.ttimeoutlen = 10
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.o.mouse = "a"
vim.o.mousemoveevent = true

---------------------------------------------------------------------------
-- Folds (treesitter — best with nvim-treesitter)
---------------------------------------------------------------------------
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldtext = ""
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldminlines = 3
vim.o.foldcolumn = "0" -- set "1" if you want a fold gutter

---------------------------------------------------------------------------
-- Editing behaviour
---------------------------------------------------------------------------
vim.o.virtualedit = "block" -- free cursor in visual block
vim.o.formatoptions = "jcroqlnt" -- sensible defaults; tweak as you like
vim.opt.shortmess:append("c") -- quieter completion messages
vim.opt.shortmess:append("I") -- no intro message
vim.opt.iskeyword:append("-") -- treat kebab-case as one word


---------------------------------------------------------------------------
-- Performance / diffs
---------------------------------------------------------------------------
vim.o.lazyredraw = false -- keep false on modern nvim; true can glitch UI
vim.o.synmaxcol = 300 -- don't syntax-highlight super long lines
vim.o.diffopt = "internal,filler,closeoff,linematch:60"

---------------------------------------------------------------------------
-- Clipboard (optional — use keymaps for + register if you prefer)
---------------------------------------------------------------------------
-- vim.o.clipboard = "unnamedplus" -- uncomment to sync with system clipboard always

---------------------------------------------------------------------------
-- Globals
---------------------------------------------------------------------------
vim.g.rustfmt_autosave = 1
vim.g.markdown_recommended_style = 0 -- don't force 4-space tabs in markdown
