# modules/hosts/desktop.nix
{
  self,
  inputs,
  withSystem,
  ...
}:
{
  flake.nixosConfigurations.laptop = withSystem "x86_64-linux" (
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

        ./_laptop/hardware.nix
        ./_laptop/configuration.nix
      ];
    }
  );
}
