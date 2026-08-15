{ self, ... }:

{
  flake.nixosModules.profile-desktop =
    { ... }:
    {
      imports = [
        self.nixosModules.profile-cli

        self.nixosModules.hardware-audio
        self.nixosModules.hardware-graphics

        self.nixosModules.desktop-fonts
        self.nixosModules.desktop-niri
        self.nixosModules.desktop-xdg
        self.nixosModules.desktop-virtualisation

        # services
        self.nixosModules.services-greetd
        self.nixosModules.services-upower
        self.nixosModules.services-nas
      ];
    };
}
