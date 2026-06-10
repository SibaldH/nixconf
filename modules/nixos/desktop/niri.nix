{ self, moduleWithSystem, ... }:
{
  flake.nixosModules.desktop-niri = moduleWithSystem (
    { self', ... }:
    {
      programs.niri = {
        enable = true;
        package = self'.packages.niri;
      };
    }
  );
}
