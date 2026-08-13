{
  flake.nixosModules.desktop-virtualisation =
    { pkgs, config, ... }:
    let
      inherit (config.nixconf) user;
    in
    {
      virtualisation.libvirtd = {
        enable = true;
        qemu = {
          package = pkgs.qemu_kvm;
          swtpm.enable = true; # virtual TPM 2.0 — required if you want Windows 11
        };
      };

      virtualisation.spiceUSBRedirection.enable = true; # nice-to-have: pass USB devices into the VM

      programs.virt-manager.enable = true; # GUI for creating/managing VMs

      users.users.${user}.extraGroups = [ "libvirtd" ];

      environment.systemPackages = [ pkgs.virtio-win ]; # driver ISO for fast virtio disk/net in the guest
    };
}
