{ self, inputs, ... }: {
  perSystem = { pkgs, lib, self', config, ... }: {
    packages.niri = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs;
      settings = 
        let
          noctaliaExe = lib.getExe self'.packages.noctalia;
        in {
        spawn-at-startup = [
          (lib.getExe self'.packages.noctalia)
        ];

        xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

        prefer-no-csd = _: {};

        input = {
          focus-follows-mouse = _: {};
          warp-mouse-to-focus = _: {};

          keyboard = {
            xkb = {
              layout = "be";
              options = "ctrl:nocaps,compose:rctrl";
            };
            repeat-rate = 40;
            repeat-delay = 250;
          };

          touchpad = {
            middle-emulation = _: {};
            natural-scroll = _: {};
            tap = _: {};
          };

          mouse = {
            accel-profile = "flat";
          };
        };

        binds = {
          "Mod+Return" = _: { props.hotkey-overlay-title = "Open a Terminal: ${self'.packages.kitty.pname}"; content.spawn = lib.getExe self'.packages.kitty; };
          "Mod+Shift+Slash" = _: { content.show-hotkey-overlay = _: {}; };
          "Mod+Space" = _: { props.hotkey-overlay-title = "Open Launcher"; content.spawn-sh = "${noctaliaExe} ipc call launcher toggle"; };
          "Mod+E" = _: { props.hotkey-overlay-title = "Open Yazi"; content.spawn = [ "${lib.getExe self'.packages.kitty}" "--hold" "${lib.getExe self'.packages.yazi}" ]; };

          "Mod+Shift+Q" = _: { props.hotkey-overlay-title = "Lock screen"; content.spawn-sh = "${noctaliaExe} ipc call lockScreen lock"; };
          "Mod+Q" = _: { content.close-window = _: {}; };
          "Mod+F" = _: { content.maximize-column = _: {}; };
          "Mod+G" = _: { content.fullscreen-window = _: {}; };
          "Mod+Shift+F" = _: { content.toggle-window-floating = _: {}; };
          "Mod+C" = _: { content.center-column = _: {}; };
          "Mod+Shift+E" = _: { content.quit = _: {}; };
          "Mod+O" = _: { props.repeat = false; content.toggle-overview = _: {}; };
          "Mod+W" = _: { content.toggle-column-tabbed-display = _: {}; };

          "Print" = _: { content.screenshot = _: {}; };
          "Ctrl+Print" = _: { content.screenshot-screen = _: {}; };
          "Alt+Print" = _: { content.screenshot-window = _: {}; };

          "Mod+H" = _: { content.focus-column-left = _: {}; };
          "Mod+L" = _: { content.focus-column-right = _: {}; };
          "Mod+K" = _: { content.focus-workspace-up = _: {}; };
          "Mod+J" = _: { content.focus-workspace-down = _: {}; };

          "Mod+Shift+H" = _: { content.move-column-left = _: {}; };
          "Mod+Shift+L" = _: { content.move-column-right = _: {}; };
          "Mod+Shift+K" = _: { content.move-column-to-workspace-up = _: {}; };
          "Mod+Shift+J" = _: { content.move-column-to-workspace-down = _: {}; };

          "Mod+1" = _: { content.focus-workspace = "w0"; };
          "Mod+2" = _: { content.focus-workspace = "w1"; };
          "Mod+3" = _: { content.focus-workspace = "w2"; };
          "Mod+4" = _: { content.focus-workspace = "w3"; };
          "Mod+5" = _: { content.focus-workspace = "w4"; };
          "Mod+6" = _: { content.focus-workspace = "w5"; };
          "Mod+7" = _: { content.focus-workspace = "w6"; };
          "Mod+8" = _: { content.focus-workspace = "w7"; };
          "Mod+9" = _: { content.focus-workspace = "w8"; };
          "Mod+0" = _: { content.focus-workspace = "w9"; };

          "Mod+Shift+1" = _: { content.move-column-to-workspace = "w0"; };
          "Mod+Shift+2" = _: { content.move-column-to-workspace = "w1"; };
          "Mod+Shift+3" = _: { content.move-column-to-workspace = "w2"; };
          "Mod+Shift+4" = _: { content.move-column-to-workspace = "w3"; };
          "Mod+Shift+5" = _: { content.move-column-to-workspace = "w4"; };
          "Mod+Shift+6" = _: { content.move-column-to-workspace = "w5"; };
          "Mod+Shift+7" = _: { content.move-column-to-workspace = "w6"; };
          "Mod+Shift+8" = _: { content.move-column-to-workspace = "w7"; };
          "Mod+Shift+9" = _: { content.move-column-to-workspace = "w8"; };
          "Mod+Shift+0" = _: { content.move-column-to-workspace = "w9"; };

          "XF86AudioRaiseVolume" = _: { props.allow-when-locked=true; content.spawn-sh = "wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+"; };
          "XF86AudioLowerVolume" = _: { props.allow-when-locked=true; content.spawn-sh = "wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-"; };
          "XF86AudioMute" = _: { props.allow-when-locked=true; content.spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"; };
          "XF86AudioMicMute" = _: { props.allow-when-locked=true; content.spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"; };

          "XF86AudioPlay" = _: { props.allow-when-locked=true; content.spawn-sh = "${pkgs.playerctl} play-pause"; };
          "XF86AudioStop" = _: { props.allow-when-locked=true; content.spawn-sh = "${pkgs.playerctl} stop"; };
          "XF86AudioPrev" = _: { props.allow-when-locked=true; content.spawn-sh = "${pkgs.playerctl} previous"; };
          "XF86AudioNext" = _: { props.allow-when-locked=true; content.spawn-sh = "${pkgs.playerctl} next"; };

          "XF86MonBrightnessUp" = _: { props.allow-when-locked=true; content.spawn = [ "${pkgs.brightnessctl}" "--class=backlight" "set" "+10%" ]; };
          "XF86MonBrightnessDown" = _: { props.allow-when-locked=true; content.spawn = [ "${pkgs.brightnessctl}" "--class=backlight" "set" "10%-" ]; };
        };
      };
    };
  };
}
