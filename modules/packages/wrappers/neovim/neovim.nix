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
          conform-nvim
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
          # search (already had)
          ripgrep
          fd

          # Rust
          rust-analyzer
          # rustfmt / clippy: use rustup toolchain or:
          # rustfmt
          # clippy

          # Nix
          nixd # or: nil
          nixfmt

          # Lua
          lua-language-server
          stylua

          # HTML / CSS / JSON
          vscode-langservers-extracted # html, css, json, eslint

          # JS / TS
          typescript-language-server
          # prettierd  # optional formatter;

          # Typst
          typst
          typstyle
          tinymist
        ];

        # Available in lua via the generated info plugin
        # require(vim.g.nix_info_plugin_name)(nil, "info", "foo")
        info = { };
      };
    };
}
