{self, moduleWithSystem, ... }: {
  flake.nixosModules.niri = moduleWithSystem (
    { self', ... }: {
      programs.niri = {
        enable = true;
        package = self'.packages.niri;
      };
    }
  );
}
