{
  flake.nixosModules.librewolf = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      librewolf
    ];

    preferences.keymap = {
      "SUPER + d"."b".package = pkgs.librewolf;
    };
  };
}
