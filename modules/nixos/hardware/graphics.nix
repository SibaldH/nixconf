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
      hardware.cpu.amd.updateMicrocode = true;
      hardware.enableRedistributableFirmware = true;
    };
}
