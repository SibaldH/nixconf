{
  self,
  inputs,
  withSystem,
  ...
}:
{
  flake.nixosConfigurations.vm = withSystem "x86_64-linux" (
    { self', inputs', ... }:
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit
          inputs
          inputs'
          self
          self'
          ;
      };

      modules = [
        self.nixosModules.profile-desktop

        ./_vm/hardware.nix
        ./_vm/configuration.nix
      ];
    }
  );
}
