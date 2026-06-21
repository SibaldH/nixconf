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
        self.nixosModules.profile-workstation
        inputs.disko.nixosModules.disko

        ./_sien/hardware.nix
        ./_sien/configuration.nix
        ./_sien/disko.nix
      ];
    }
  );
}
