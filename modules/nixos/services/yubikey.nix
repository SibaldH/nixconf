{ self, input, ... }:

{
  flake.nixosModules.services-yubikey =
    {
      pkgs,
      config,
      ...
    }:
    {
      environment.systemPackages = with pkgs; [
        yubioath-flutter
      ];

      services.udev.packages = [ pkgs.yubikey-personalization ];

      services.udev.extraRules = ''
        ACTION=="remove",\
         ENV{ID_BUS}=="usb",\
         ENV{ID_MODEL_ID}=="0407",\
         ENV{ID_VENDOR_ID}=="1050",\
         ENV{ID_VENDOR}=="Yubico",\
         RUN+="${pkgs.systemd}/bin/loginctl lock-sessions"
      '';

      programs.gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
      };
    };
}
