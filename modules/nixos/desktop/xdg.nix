{ self, ... }: {
  flake.nixosModules.desktop-xdg =
    {
      pkgs,
      ...
    }:
    {
      xdg.portal = {
        enable = true;
        extraPortals = with pkgs; [
          xdg-desktop-portal-gtk
        ];
      };
    };
}
