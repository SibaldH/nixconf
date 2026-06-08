{ self, ... }:

{
  flake.nixosModules.profile-desktop =
    { pkgs, ... }:
    {
      imports = [
        self.nixosModules.profile-cli
        # self.nixosModules.hardware-audio
        # self.nixosModules.hardware-bluetooth
        # self.nixosModules.desktop-fonts
        # self.nixosModules.desktop-niri
      ];

      environment.systemPackages = with pkgs; [
        vlc
        libreoffice
        signal-desktop
      ];
    };
}
