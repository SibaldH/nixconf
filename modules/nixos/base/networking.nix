{ self, ... }: {
  flake.nixosModules.network =
    {
      pkgs,
      lib,
      config,
      ...
    }:
    {
      networking = {
        networkmanager.enable = true;
        networkmanager.unmanaged = [ "wlp15s0" ];
        firewall.allowedTCPPorts = [
          22
          53
          67
        ];
      };
    };
}
