{self, ...}: {
  flake.nixosModules.general = {
    pkgs,
    config,
    ...
  }:
  let
      selfpkgs = self.packages.${pkgs.stdenv.hostPlatform.system};
  in {
    imports = [
      self.nixosModules.nix
    ];

    users.users.${config.preferences.user.name} = {
      isNormalUser = true;
      description = "${config.preferences.user.name}'s account";
      extraGroups = ["wheel" "networkmanager"];
      shell = selfpkgs.environment;

      hashedPassword = "/persist/passwd";
      initialPassword = "12345";
    };
  };
}
