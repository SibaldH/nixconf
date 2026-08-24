{ self, ... }:
{
  flake.nixosModules.services-printing =
    {
      pkgs,
      config,
      ...
    }:
    {
      services.printing = {
        enable = true;
        drivers = with pkgs; [
          gutenprint
          hplip
          brlaser
          brgenml1lpr
          brgenml1cupswrapper
        ];
      };

      # Discover network/driverless (IPP) printers and let CUPS be found on the LAN
      services.avahi = {
        enable = true;
        nssmdns4 = true;
        openFirewall = true;
      };

      # GUI for adding/managing printers
      environment.systemPackages = with pkgs; [
        system-config-printer
      ];
    };
}
