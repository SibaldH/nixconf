{ self, inputs, ... }: {
  perSystem = { pkgs, ... }: {
    packages.kitty = inputs.wrapper-modules.wrappers.kitty.wrap {
      inherit pkgs;
      extraPackages = with pkgs; [ jetbrains-mono ];
      settings = {
        enable_audio_bell = "no";

        font_family = "JetBrainsMono Nerd Font";

        background_opacity = 0.50;
      };
    };
  };
}
