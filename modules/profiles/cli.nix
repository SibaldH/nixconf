{ self, ... }:

{
  flake.nixosModules.profile-cli =
    { pkgs, ... }:
    {
      imports = [
        self.nixosModules.profile-minimal
        self.nixosModules.base-direnv
        self.nixosModules.services-yubikey
      ];

      programs.ydotool.enable = true;

      environment.systemPackages = with pkgs; [
        ripgrep
        fd
        jq
        eza
        bat
        fzf
        btop
      ];
    };
}
