{ config, pkgs, ... }: {
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    loader.grub.enable = true;
    loader.grub.efiSupport = true;
    loader.grub.device = "nodev";
    loader.grub.useOSProber = true;
    loader.efi.canTouchEfiVariables = true;
  };

  nixconf = {
    user = "sien";
    fullName = "Sibald Hulsemlans";
    email = "sibald.hulselmans@protonmail.com";
    hostName = "homeserver";
  };
}
