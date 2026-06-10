{ self, ... }:

{
  flake.nixosModules.users = { pkgs, user, ... }: {
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
        ];
        initialPassword = "root";
      };
    };

    services.getty.autologinUser = user;
  };
}
