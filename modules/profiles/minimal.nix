{ self, ... }:
{
  flake.nixosModules.profile-minimal =
    { pkgs, self, ... }:
    {
      imports = [
        # base modules
        self.nixosModules.base-locales
        self.nixosModules.base-network
        self.nixosModules.base-nix
        self.nixosModules.base-plymouth
        self.nixosModules.base-settings
        self.nixosModules.base-users

        # services
        self.nixosModules.services-greetd
      ];

      environment.systemPackages = with pkgs; [
        curl
        wget
        git
        vim
      ];
    };
}
