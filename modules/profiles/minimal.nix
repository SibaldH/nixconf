{ self, ... }:
{
  flake.nixosModules.profile-minimal =
    { pkgs, self, ... }:
    {
      imports = [
        # base modules
        self.nixosModules.locales
        self.nixosModules.network
        self.nixosModules.nix
      ];

      environment.systemPackages = with pkgs; [
        curl
        wget
        git
        vim
      ];
    };
}
