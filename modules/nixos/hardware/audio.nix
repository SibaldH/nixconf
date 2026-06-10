{ self, ... }: {
  flake.nixosModules.hardware-audio =
    {
      pkgs,
      config,
      ...
    }:
    {
      security.rtkit.enable = true;
      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
      };
    };
}
