vim.loader.enable()

-- nix info (early)
do
  local ok
  ok, _G.nixInfo = pcall(require, vim.g.nix_info_plugin_name)
  if not ok then
    package.loaded[vim.g.nix_info_plugin_name] = setmetatable({}, {
      __call = function(_, default)
        return default
      end,
    })
    _G.nixInfo = require(vim.g.nix_info_plugin_name)
  end
  nixInfo.isNix = vim.g.nix_info_plugin_name ~= nil
end

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.lsp")

require("plugins.treesitter")
require("plugins.fidget")
require("plugins.telescope")
require("plugins.oil")
require("plugins.harpoon")
require("plugins.mini")
