{
  osConfig,
  lib,
  ...
}: let
  cfg = osConfig.modules.wm;
in {
  config = lib.mkIf (cfg.enable && cfg.hyprland.enable) {
    wayland.windowManager.hyprland.settings = {
      # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
      # See https://wiki.hyprland.org/Configuring/Workspace-Rules/ for workspace rules

      # Example windowrule
      # windowrule = float,class:^(kitty)$,title:^(kitty)$

      # Ref https://wiki.hyprland.org/Configuring/Workspace-Rules/
      # "Smart gaps" / "No gaps when only"
      # uncomment all if you wish to use that.
      workspace = [
        # "w[tv1]s[false], gapsout:0, gapsin:0"
        # "f[1]s[false], gapsout:0, gapsin:0"
        "1, monitor:HDMI-A-1, default:true"
      ];
      windowrule = [
        # "bordersize 0, floating:0, onworkspace:w[tv1]s[false]"
        # "rounding 0, floating:0, onworkspace:w[tv1]s[false]"
        # "bordersize 0, floating:0, onworkspace:f[1]s[false]"
        # "rounding 0, floating:0, onworkspace:f[1]s[false]"

        # Ignore maximize requests from apps. You'll probably like this.
        # "suppressevent maximize, class:.*"

        # Fix some dragging issues with XWayland
        # "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];

      # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
      dwindle = {
        pseudotile = "true"; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = "true"; # You probably want this
      };

      # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
      master = {
        new_status = "master";
      };
    };
  };
}
