{ config, pkgs, ... }: {
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    loader.systemd-boot.enable = true;
    loader.efi.efiSysMountPoint = "/boot";
    loader.efi.canTouchEfiVariables = true; };

  nixconf = {
    user = "jay";
    fullName = "Sibald Hulsemlans";
    email = "sibald.hulselmans@protonmail.com";
    hostName = "laptop";
  };

}
