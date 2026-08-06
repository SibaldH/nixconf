{ self, inputs, ... }:
{
  perSystem =
    { pkgs, system, ... }:
    let
      pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfreePredicate =
          pkg:
          builtins.elem (inputs.nixpkgs.lib.getName pkg) [
            "steam"
            "steam-unwrapped"
          ];
      };
    in

    {
      packages.lutris = pkgs.lutris.override {
        extraPkgs =
          pkgs: with pkgs; [
            wineWow64Packages.stable
            winetricks
            gamemode
            gamescope
            mangohud
            protontricks
            umu-launcher
          ];
        extraLibraries =
          pkgs: with pkgs; [
            vulkan-loader
            libGL
          ];
      };
    };
}
