{ self, ... }:
{
  flake.nixosModules.services-nas =
    {
      pkgs,
      config,
      lib,
      ...
    }:
    let
      inherit (config.nixconf) user;

      nasHost = "192.168.1.96";
      shares = [
        "docker"
        "Downloads"
        "Kids"
        "Media"
        "Sibald"
      ];

      mkNasMount = shareName: {
        device = "//${nasHost}/${shareName}";
        fsType = "cifs";
        options = [
          "credentials=/etc/nixos/smb-secrets"
          "uid=1000"
          "gid=100"
          "vers=2.0"
          "x-systemd.automount"
          "noauto"
          "x-systemd.idle-timeout=60"
          "x-systemd.device-timeout=5s"
          "x-systemd.mount-timeout=5s"
        ];
      };
    in
    {
      boot.supportedFilesystems = [ "cifs" ];

      environment.systemPackages = with pkgs; [
        cifs-utils
        samba
      ];

      fileSystems = builtins.listToAttrs (
        map (shareName: {
          name = "/home/${user}/Nas/${lib.toLower shareName}";
          value = mkNasMount shareName;
        }) shares
      );
    };
}
