{ self, ... }: {
  flake.nixosModules.services-openssh =
    {
      pkgs,
      config,
      ...
    }:
    {
      services.openssh.enable = true;
    };
}
