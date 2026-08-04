{ inputs, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages.neovim = inputs.wrapper-modules.wrappers.neovim.wrap {
        inherit pkgs;

        # This directory is the neovim config (init.lua next to this file)
        settings.config_directory = ./.;

        # Startup plugins
        specs.general = with pkgs.vimPlugins; [
	  telescope-nvim
          plenary-nvim # telescope dependency
          telescope-fzf-native-nvim
          vim-sleuth
          nvim-treesitter.withAllGrammars
          nvim-lspconfig
	  oil-nvim
          fidget-nvim
          harpoon2
          mini-nvim
        ];

        # Lazy until packadd / a lazy loader
        specs.lazy = {
          lazy = true;
          data = with pkgs.vimPlugins; [
            which-key-nvim
            gitsigns-nvim
          ];
        };

        # Tools on PATH for this neovim only
        runtimePkgs = with pkgs; [
          nixd
          nixfmt
          lua-language-server
          stylua
          ripgrep
          fd
        ];

        # Available in lua via the generated info plugin
        # require(vim.g.nix_info_plugin_name)(nil, "info", "foo")
        info = { };
      };
    };
}
