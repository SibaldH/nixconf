{ self, moduleWithSystem, ... }:

{
  flake.nixosModules.profile-workstation = moduleWithSystem (
    { self', ... }:

    { ... }:

    {
      imports = [
        self.nixosModules.profile-desktop
      ];

      environment.systemPackages = [
        self'.packages.kitty
        self'.packages.yazi
        # self'.packages.neovim
        # self'.packages.nushell
        # self'.packages.tmux
      ];
    }
  );
}
