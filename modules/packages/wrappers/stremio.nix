{ self, inputs, ... }:
{
  perSystem =
    { system, ... }:
    let
      pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfreePredicate =
          pkg: builtins.elem (inputs.nixpkgs.lib.getName pkg) [ "stremio-linux-shell" ];
      };
    in
    {
      packages.stremio = pkgs.stremio-linux-shell;
    };
}
