{ inputs, ... }:

{
  perSystem =
    { pkgs, ... }:
    {
      packages.zed = inputs.wrapper-modules.wrappers.zed.wrap {
        inherit pkgs;

        userSettings = {
          theme = "Catppuccin Mocha";
          vim_mode = true;

          ui_font_family = "JetBrainsMono Nerd Font";
          buffer_font_family = "JetBrainsMono Nerd Font";

          telemetry = {
            diagnostics = false;
            metrics = false;
          };
        };

        extensions = [
          "nix"
          "toml"
        ];

        userKeymaps = [
          {
            context = "Workspace";
            bindings = {
              ctrl-shift-t = "workspace::NewTerminal";
            };
          }
        ];

        userTasks = [
          {
            label = "nix flake check";
            command = "nix";
            args = [
              "flake"
              "check"
            ];
          }
        ];

        runtimePkgs = with pkgs; [
          nil
          nixd
          alejandra
        ];

        # While testing, this is useful if you already have ~/.config/zed files.
        # After testing, you may want to set this back to false.
        forceSymlinks = true;
      };
    };
}
