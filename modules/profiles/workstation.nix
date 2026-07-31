{ self, moduleWithSystem, ... }:

{
  flake.nixosModules.profile-workstation = moduleWithSystem (
    { self', pkgs, ... }:

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
	self'.packages.stremio

        pkgs.vlc
        pkgs.libreoffice
        pkgs.signal-desktop
        pkgs.librewolf
        pkgs.ferdium
      ];
    }
  );
}
