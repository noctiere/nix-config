{
  osConfig,
  lib,
  ...
}: let
  cfg = osConfig.windowManager;
in {
  config = lib.mkIf (cfg.enable && cfg.hyprland.enable) {
    wayland.windowManager.hyprland.settings = {
      # https://wiki.hyprland.org/Configuring/Variaibles/#input
      input = {
        kb_layout = "us,ru";
        # kb_variant =
        # kb_model =
        kb_options = "grp:win_space_toggle";
        # kb_rules =
        follow_mouse = "1";
        sensitivity = "0"; # -1.0 - 1.0, 0 means no modification.
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
    };
  };
}
