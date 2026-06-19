{ self, moduleWithSystem, ... }:
{
  flake.nixosModules.desktop-niri = moduleWithSystem (
    { self', ... }:
    { pkgs, ... }:
    {
      programs.niri = {
        enable = true;
        package = self'.packages.niri;
      };

      systemd.user.services.niri.enableDefaultPath = false;

      security.polkit.enable = true;
      services.gnome.gnome-keyring.enable = true;

      environment.sessionVariables.NIXOS_OZONE_WL = "1";

      hardware.graphics.enable = true;

      environment.systemPackages = with pkgs; [
        xwayland-satellite
        wl-clipboard
        brightnessctl
        playerctl
      ];
    }
  );
}
