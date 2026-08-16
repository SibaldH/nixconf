{ self, moduleWithSystem, ... }:
{
  flake.nixosModules.desktop-noctalia = moduleWithSystem (
    { self', ... }:
    { pkgs, ... }:
    {
      programs.noctalia = {
        enable = true;
        systemd.enable = true;
        package = self'.packages.noctalia;

        recommendedServices.enable = true;
      };

      environment.systemPackages = with pkgs; [
        ddcutil
        proton-pass-cli
        python3
        xdg-utils
        udiskie
        udisks
      ];
    }
  );
}
