{
  osConfig,
  lib,
  ...
}: let
  cfg = osConfig.windowManager;
in {
  config = lib.mkIf (cfg.enable && cfg.hyprland.enable) {
    wayland.windowManager.hyprland.settings = {
      # See https://wiki.hyprland.org/Configuring/Monitors/
      monitor = [
        "eDP-1, 1920x1080@144, 0x0, 1"
        "HDMI-A-1, 1920x1080@60, auto-left, 1"
      ];
    };
  };
}
