{ self, inputs, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages.mpv = inputs.wrapper-modules.wrappers.mpv.wrap {
        inherit pkgs;
      };
    };
}
