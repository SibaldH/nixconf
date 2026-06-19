{ config, pkgs, ... }: {
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader.grub = {
      enable = true;
      device = "/dev/vda";
      useOSProber = true;
    };
  };

  services.qemuGuest.enable = true;

  nix.settings.trusted-users = [
    "root"
    "jay"
  ];
  security.sudo.wheelNeedsPassword = false;
  users.users.${config.nixconf.user}.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOsiIMWKFoaBLwckqq0BpbWRXYsctBxchdvbbBLbVIIx jay@nixconf-vm"
  ];

  nixconf = {
    user = "jay";
    fullName = "Sibald Hulsemlans";
    email = "sibald.hulselmans@protonmail.com";
    hostName = "vm";
  };
}
