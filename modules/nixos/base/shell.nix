{ ... }:
{
  flake.nixosModules.base-shell =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        eza # modern ls
        bat # modern cat
        ripgrep # modern grep (rg)
        fd # modern find
        fzf # fuzzy finder (Ctrl-R / Ctrl-T)
        nushell # keep it installed for `cmd | nu -c '...'` one-liners
        microfetch
      ];

      programs.starship.enable = true;

      programs.zoxide = {
        enable = true;
        enableBashIntegration = true;
      };

      programs.bash = {
        blesh.enable = true;
        completion.enable = true;
      };

      programs.bash.shellAliases = {
        ls = "eza --icons --group-directories-first";
        ll = "eza -la --icons --group-directories-first";
        lt = "eza --tree --icons";
        cat = "bat --paging=never";
        find = "fd";
        grep = "rg";
        cd = "z";
      };

      programs.bash.interactiveShellInit = ''
        source ${pkgs.fzf}/share/fzf/key-bindings.bash
        source ${pkgs.fzf}/share/fzf/completion.bash

        microfetch
      '';
    };
}
