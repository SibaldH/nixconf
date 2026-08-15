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
            audio = [
              {
                run = ''${lib.getExe self'.packages.mpv} --force-window=yes "$@"'';
                orphan = true;
                desc = "Play in mpv";
              }
            ];
          };
          open = {
            rules = [
              {
                mime = "application/pdf";
                use = "pdf";
              }
              {
                mime = "audio/*";
                use = "audio";
              }
            ];
          };
        };
      };
    };
}
