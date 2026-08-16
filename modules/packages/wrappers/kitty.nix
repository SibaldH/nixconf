{ self, inputs, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages.kitty = inputs.wrapper-modules.wrappers.kitty.wrap {
        inherit pkgs;
        runtimePkgs = with pkgs; [ nerd-fonts.jetbrains-mono ];
        settings = {
          enable_audio_bell = "no";

          font_family = "JetBrainsMono Nerd Font";

          background_opacity = 0.70;
        };
      };
    };
}
