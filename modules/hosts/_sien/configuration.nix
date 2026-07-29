{ config, lib, pkgs, ... }: {
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    loader.grub.enable = true;
    loader.grub.efiSupport = true;
    loader.grub.device = "nodev";
    loader.grub.useOSProber = true;
    loader.efi.canTouchEfiVariables = true;
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  users.users.${config.nixconf.user}.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINbUV3W+ojNQtUAulCN2FYL0e3FJxDr4rmk0fMXOCz96 jay@nixconf-sien"
  ];

  nixconf = {
    user = "sien";
    fullName = "Sibald Hulsemlans";
    email = "sibald.hulselmans@protonmail.com";
    hostName = "sien";
  };
}
