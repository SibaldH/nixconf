{
  self,
  ...
}:
{
  flake.nixosModules.base-nix =
    {
      pkgs,
      lib,
      ...
    }:
    {
      nix.settings = {
        experimental-features = [
          "nix-command"
          "flakes"
        ];

        # Binary caches: prefer these over building from source.
        # Only add caches/keys you actually trust - a compromised key
        # means Nix will accept substituted packages as authentic.
        substituters = [
          "https://cache.nixos.org"
          "https://nix-community.cachix.org"
          "https://noctalia.cachix.org"
        ];
        trusted-public-keys = [
          "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
        ];

        # Parallel building.
        max-jobs = "auto"; # build multiple derivations concurrently
        cores = 0; # let each build use all available cores

        # Hardlink duplicate files in the store to cut disk I/O.
        auto-optimise-store = true;
      };

      nixpkgs.config.allowUnfree = true;
      system.stateVersion = "26.05";
    };
}
