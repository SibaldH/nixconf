{ self, ... }: {
  flake.nixosModules.services-greetd =
    {
      pkgs,
      config,
      ...
    }:
    let
      inherit (config.nixconf) user;
    in
    {
      services.greetd = {
        enable = true;
        settings.default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --remember-session --cmd ${config.programs.niri.package}/bin/niri-session";
          user = "${user}";
        };
      };

      security.pam.services.greetd.enableGnomeKeyring = true;
    };
}
