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

  nixconf = {
    user = "jay";
    fullName = "Sibald Hulsemlans";
    email = "sibald.hulselmans@protonmail.com";
    hostName = "vm";
  };

}
