{ self, moduleWithSystem, ... }:

{
  flake.nixosModules.profile-workstation = moduleWithSystem (
    { self', ... }:

    { pkgs, lib, ... }:

    {
      imports = [
        self.nixosModules.profile-desktop
      ];

      nixpkgs.config.allowUnfreePredicate = pkg:
        builtins.elem (lib.getName pkg) [
          "spotify"
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
        pkgs.spotify
      ];
    }
  );
}
