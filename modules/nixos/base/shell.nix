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
      ];

      programs.starship.enable = true;

      programs.zoxide = {
        enable = true;
        enableBashIntegration = true;
      };

      programs.bash.interactiveShellInit = ''
        source ${pkgs.fzf}/share/fzf/key-bindings.bash
        source ${pkgs.fzf}/share/fzf/completion.bash

        alias ls='eza --icons --group-directories-first'
        alias ll='eza -la --icons --group-directories-first'
        alias lt='eza --tree --icons'
        alias cat='bat --paging=never'
        alias find='fd'
        alias grep='rg'
      '';
    };
}
