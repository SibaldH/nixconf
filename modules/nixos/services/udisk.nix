{ self, ... }: {
  flake.nixosModules.services-udisk2 =
    {
      pkgs,
      config,
      ...
    }:
    {
      services.udisks2.enable = true;
    };
}
