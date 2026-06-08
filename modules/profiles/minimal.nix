{
  flake.nixosModules.profile-minimal =
    { pkgs, ... }:
    {
      imports = [
        # base modules can be added here through self.nixosModules if needed
      ];

      environment.systemPackages = with pkgs; [
        curl
        wget
        git
        vim
      ];
    };
}
