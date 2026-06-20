{ self, ... }: {
  flake.nixosModules.base-bluetooth =
    {
      pkgs,
      config,
      ...
    }:
    {
      hardware.bluetooth.enable = true;
      hardware.bluetooth.powerOnBoot = true;

      services.blueman.enable = true;
    };
}
