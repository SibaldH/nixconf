{ self, inputs, ... }: {
  flake.nixosConfigurations.main = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.hostMain
      self.nixosModules.niri
      self.nixosModules.swaylock
    ];
  };

  flake.nixosModules.hostMain = { pkgs, lib, ... }: {
    imports = [];

    environment.systemPackages = with pkgs; [
      glib
      perl
      glibcLocales
    ];

      i18n = {
        defaultLocale = "en_US.UTF-8";
        extraLocaleSettings = {
          LANGUAGE = "en_US.UTF-8";
          LANG = "en_US.UTF-8";
          LC_TIME = "nl_BE.UTF-8";
          LC_NUMERIC = "nl_BE.UTF-8";
          LC_IDENTIFICATION = "nl_BE.UTF-8";
          LC_MONETARY = "nl_BE.UTF-8";
          LC_ADDRESS = "nl_BE.UTF-8";
          LC_TELEPHONE = "nl_BE.UTF-8";
          LC_MEASUREMENT = "nl_BE.UTF-8";
          LC_NAME = "nl_BE.UTF-8";
          LC_MESSAGES = "en_US.UTF-8";
        };
      };


    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    boot = {
      kernelPackages = pkgs.linuxPackages_latest;

      loader.grub.enable = true;
      loader.grub.efiSupport = true;
      loader.grub.device = "nodev";
      loader.grub.useOSProber = true;
      loader.efi.canTouchEfiVariables = true;

      plymouth.enable = true;
    };

    networking = {
      hostName = "main";
      networkmanager.enable = true;
      networkmanager.unmanaged = ["wlp15s0"];
      firewall.allowedTCPPorts = [ 22 53 67 ];
    };

    hardware.cpu.amd.updateMicrocode = true;

    services = {
      hardware.openrgb.enable = true;
      udisks2.enable = true;
      printing.enable = true;
    };

    xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

      config.common.default = [ "gtk" ];
    };
    
    hardware.graphics.enable = true;

    services.xserver.videoDrivers = ["amdgpu"];
    boot.initrd.kernelModules = ["amdgpu"];

    system.stateVersion = "25.11";
  };
}
