{ self, ... }:

{
  flake.nixosModules.base-settings =
    { lib, ... }:
    {
      options.nixconf = {
        user = lib.mkOption {
          type = lib.types.str;
          description = "Main system username.";
        };

        fullName = lib.mkOption {
          type = lib.types.str;
          default = "";
          description = "Full name of the main user.";
        };

        email = lib.mkOption {
          type = lib.types.str;
          default = "";
          description = "Email address of the main user.";
        };

        hostName = lib.mkOption {
          type = lib.types.str;
          description = "Hostname for this machine.";
        };
      };
    };
}
