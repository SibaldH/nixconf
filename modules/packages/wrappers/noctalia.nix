{ self, inputs, ... }:
{
  perSystem =
    { pkgs, system, ... }:
    let
      noctaliaPkg = inputs.noctalia.packages.${system}.default;

      settings = builtins.fromTOML (builtins.readFile ./noctalia.toml);
      configToml = (pkgs.formats.toml { }).generate "config.toml" settings;
      configDir = pkgs.runCommand "noctalia-config-dir" { } ''
        mkdir -p $out/noctalia
        cp ${configToml} $out/noctalia/config.toml
      '';
    in
    {
      packages.noctalia = inputs.wrapper-modules.lib.wrapPackage {
        inherit pkgs;
        package = noctaliaPkg;
        env.NOCTALIA_CONFIG_HOME = "${configDir}";
      };
    };
}
