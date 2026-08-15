{ self, inputs, ... }:
{
  perSystem =
    {
      pkgs,
      lib,
      self',
      ...
    }:
    {
      packages.yazi = inputs.wrapper-modules.wrappers.yazi.wrap {
        inherit pkgs;
        settings.yazi = {
          opener = {
            pdf = [
              {
                run = ''${lib.getExe self'.packages.zathura} "$@"'';
                orphan = true;
                desc = "Open in zathura";
              }
            ];
          };
          open = {
            rules = [
              {
                mime = "application/pdf";
                use = "pdf";
              }
            ];
          };
        };
      };
    };
}
