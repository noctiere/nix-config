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
      exec-once = [
        "telegram-desktop -startintray"
        "waybar"
      ];
    };
  };
}
