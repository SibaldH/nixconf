{ self, ... }: {
  flake.nixosModules.base-network =
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
        firewall.allowedTCPPorts = [
          22
          53
          67
        ];
      };
      users.users.${config.nixconf.user}.extraGroups = [ "networkmanager" ];
    };
}
