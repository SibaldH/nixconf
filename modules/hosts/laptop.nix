# modules/hosts/desktop.nix
{
  self,
  inputs,
  withSystem,
  ...
}:
{
  flake.nixosConfigurations.laptop =
    let
      system = "x86_64-linux";
    in
    withSystem system (
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

          ../../hosts/laptop/hardware.nix

          {
            networking.hostName = "laptop";
            nixpkgs.hostPlatform = "${system}";
          }
        ];
      }
    );
}
