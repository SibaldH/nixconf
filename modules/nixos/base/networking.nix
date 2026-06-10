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
        hostName = config.nixconf.hostName;
        networkmanager.enable = true;
        networkmanager.unmanaged = [ "wlp15s0" ];
        firewall.allowedTCPPorts = [
          22
          53
          67
        ];
      };
      users.users.${config.nixconf.user}.extraGroups = [ "networkmanager" ];
    };
}
