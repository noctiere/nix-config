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
      # See https://wiki.hyprland.org/Configuring/Monitors/
      monitor = [
        "eDP-1, 1920x1080@144, 0x0, 1"
        "HDMI-A-1, 2560x1440@144, auto-center-up, 1"
      ];
    };
  };
}
