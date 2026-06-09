{ config, pkgs, ... }: {
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    loader.grub.enable = true;
    loader.grub.efiSupport = true;
    loader.grub.device = "nodev";
    loader.grub.useOSProber = true;
    loader.efi.canTouchEfiVariables = true;

    plymouth.enable = true;
  };

  networking.hostName = "laptop";
  system.stateVersion = "26.05";
}
