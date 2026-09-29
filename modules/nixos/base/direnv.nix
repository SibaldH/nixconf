{ ... }:
{
  flake.nixosModules.base-direnv =
    { pkgs, ... }:
    {
      programs.direnv = {
        enable = true;
        nix-direnv.enable = true; # caches the nix build, much faster reloads
      };
    };
}
