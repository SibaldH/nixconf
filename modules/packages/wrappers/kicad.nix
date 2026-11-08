{ ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      # nixpkgs' KiCad wrapper *sets* PYTHONPATH, so wrapping the finished
      # binary with `--prefix PYTHONPATH` would just be overwritten. Instead we
      # extend the `pythonPath` list the package itself feeds into that wrapper.
      # Only the thin wrapper derivation is rebuilt, not kicad-base.
      packages.kicad = pkgs.kicad.overrideAttrs (old: {
        pythonPath = (old.pythonPath or [ ]) ++ [
          pkgs.python314Packages.scipy
          pkgs.python314Packages.shapely
        ];
      });
    };
}
