{
  flake.nixosModules.librewolf = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      telegram-desktop
    ];

    preferences.keymap = {
      "SUPER + d"."t".package = pkgs.telegram-desktop;
    };
  };
}

