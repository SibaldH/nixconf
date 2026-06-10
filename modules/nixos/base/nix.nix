{
  self,
  ...
}:
{
  flake.nixosModules.base-nix =
    {
      pkgs,
      lib,
      ...
    }:
    {
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
      nixpkgs.config.allowUnfree = true;
      system.stateVersion = "26.05";
    };
}
