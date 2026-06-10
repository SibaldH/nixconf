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
        theme = "rings";
        themePackages = with pkgs; [
          # By default we would install all themes
          (adi1090x-plymouth-themes.override {
            selected_themes = [ "cuts" ];
          })
        ];
      };

      # Enable "Silent boot"
      consoleLogLevel = 3;
      initrd.verbose = false;
      kernelParams = [
        "quiet"
        "rd.udev.log_level=3"
        "rd.systemd.show_status=auto"
      ];

      # Hide the OS choice for bootloaders.
      # It's still possible to open the bootloader list by pressing any key
      # It will just not appear on screen unless a key is pressed
      loader.timeout = 0;
    };
}
