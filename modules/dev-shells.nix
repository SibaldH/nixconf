{ inputs, ... }:
{
  imports = [ inputs.devenv.flakeModule ];

  perSystem = { pkgs, ... }: {
    devenv.shells.rust = {
      packages = with pkgs; [
        pkgsCross.mingwW64.stdenv.cc # Windows cross linker (x86_64-w64-mingw32-gcc)
        zig # backs cargo-zigbuild for macOS targets
        cargo-zigbuild
      ];

      languages.rust = {
        enable = true;
        channel = "stable";
        components = [
          "rustc"
          "cargo"
          "clippy"
          "rustfmt"
          "rust-src"
        ];
        targets = [
          "x86_64-pc-windows-gnu"
          "x86_64-apple-darwin"
          "aarch64-apple-darwin"
        ];
      };

      env.CARGO_TARGET_X86_64_PC_WINDOWS_GNU_LINKER = "${pkgs.pkgsCross.mingwW64.stdenv.cc}/bin/x86_64-w64-mingw32-gcc";

      enterShell = ''
        echo "rust: $(rustc --version)"
      '';
    };

    devenv.shells.arduino = {
      packages = with pkgs; [
        arduino-cli
        avrdude
        picocom # serial monitor, drop if you don't need it
      ];

      enterShell = ''
        echo "arduino-cli: $(arduino-cli version)"
      '';
    };
  };
}
