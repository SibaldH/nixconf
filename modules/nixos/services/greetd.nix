{ self, moduleWithSystem, ... }: {
  flake.nixosModules.services-greetd = moduleWithSystem (
    { self', ... }:
    {
      pkgs,
      config,
      ...
    }:
    {
      services.greetd = {
        enable = true;
        settings.default_session = {
          command = "${self'.packages.niri}/bin/niri-session";
          user = "${config.nixconf.user}";
        };
      };
    }
  );
}
