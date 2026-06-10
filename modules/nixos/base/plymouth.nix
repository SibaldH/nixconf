{ self, ... }:

{
  flake.nixosModules.base-plymouth =
    {
      config,
      pkgs,
      ...
    }:
    {
      boot.plymouth = {
        enable = true;
        theme = "cuts";
        themePackages = with pkgs; [
          # By default we would install all themes
          (adi1090x-plymouth-themes.override {
            selected_themes = [ "cuts" ];
          })
        ];
      };

      # Enable "Silent boot"
      boot.consoleLogLevel = 3;
      boot.initrd.verbose = false;
      boot.kernelParams = [
        "quiet"
        "rd.udev.log_level=3"
        "rd.systemd.show_status=auto"
      ];

      # Hide the OS choice for bootloaders.
      # It's still possible to open the bootloader list by pressing any key
      # It will just not appear on screen unless a key is pressed
      boot.loader.timeout = 0;
    };
}
