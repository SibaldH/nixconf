{ self, ... }:
{
  flake.nixosModules.base-nh =
    {
      self,
      pkgs,
      config,
      ...
    }:
    let
      inherit (config.nixconf) user;
    in
    {
      programs.nh = {
        enable = true;
        package = pkgs.nh;
        flake = "/home/${user}/nixconf";

        clean = {
          enable = true;
          dates = "weekly";
          extraArgs = "--keep-since 7d --keep 5";
        };
      };
    };
}
