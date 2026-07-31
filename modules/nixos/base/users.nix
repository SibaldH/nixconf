{ self, ... }:

{
  flake.nixosModules.base-users =
    { pkgs, config, ... }:
    let
      inherit (config.nixconf) user;
    in
    {
      users = {
        users.${user} = {
          isNormalUser = true;
          shell = pkgs.nushell;
          extraGroups = [
            "wheel"
            "video"
            "input"
            "dialout"
            "adbusers"
	    "ydotool"
          ];
          initialPassword = "root";
        };
      };

      # services.getty.autologinUser = user;
    };
}
