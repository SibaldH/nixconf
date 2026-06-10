{ self, ... }: {
  flake.nixosModules.hardware-graphics =
    {
      pkgs,
      config,
      ...
    }:
    {
      hardware.graphics = {
        enable = true;
        enable32Bit = true;
      };
    };
}
