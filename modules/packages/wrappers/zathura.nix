{ self, inputs, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages.zathura = inputs.wrapper-modules.wrappers.zathura.wrap {
        inherit pkgs;
        settings = { };
      };
    };
}
