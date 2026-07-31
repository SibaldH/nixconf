{ self, ... }: {
  flake.nixosModules.services-greetd =
    {
      pkgs,
      config,
      ...
    }:
    {
      services.greetd = {
        enable = true;
        settings.default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --remember-session --cmd ${config.programs.niri.package}/bin/niri-session";
	  user = "${config.nixconf.user}";
        };
      };
    };
}
