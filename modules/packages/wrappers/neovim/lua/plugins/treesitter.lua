-- withAllGrammars already provides parsers; no ensure_installed / TSUpdate needed

-- Optional: only if you need to tweak install_dir (usually skip on Nix)
-- require("nvim-treesitter").setup({})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true }),
  callback = function(ev)
    local ok = pcall(vim.treesitter.start, ev.buf)
    if not ok then
      return
    end

    -- folds (matches your options.lua foldexpr)
    vim.wo.foldmethod = "expr"
    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"

    -- indent if the module exists
    pcall(function()
      vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end)
  end,
})
