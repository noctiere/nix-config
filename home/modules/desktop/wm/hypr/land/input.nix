{
  osConfig,
  config,
  lib,
  ...
}: let
  osCfg = osConfig.modules.desktop.wm.hypr;
  cfg = config.hmModules.desktop.wm.hypr.land;
in {
  config = lib.mkIf (osCfg.enable && cfg.enable) {
    wayland.windowManager.hyprland.settings = {
      # https://wiki.hyprland.org/Configuring/Variaibles/#input
      input = {
        kb_layout = "us,ru";
        # kb_variant =
        # kb_model =
        kb_options = "grp:lalt_lshift_toggle";
        # kb_rules =
        # follow_mouse = "1";
        sensitivity = 0.25; # -1.0 - 1.0, 0 means no modification.
        touchpad = {
          natural_scroll = "true";
          scroll_factor = 0.2;
        };
      };

      cursor = {
        "no_hardware_cursors" = "true";
      };

      general = {
        "resize_on_border" = "true";
      };

      # Enable touchpad gestures for changing workspaces
      # See https://wiki.hyprland.org/Configuring/Gestures/
      gesture = "3, horizontal, workspace";
    };
  };
}
