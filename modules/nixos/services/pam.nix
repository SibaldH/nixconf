{ self, ... }: {
  flake.nixosModules.services-pam =
    { ... }:
    {
      services.gnome.gnome-keyring.enable = true;

      security.pam.services = {
        greetd.enableGnomeKeyring = true;
        login = {
          u2fAuth = true;
          enableGnomeKeyring = true;
        };
        sudo.u2fAuth = true;
      };

    };
}
