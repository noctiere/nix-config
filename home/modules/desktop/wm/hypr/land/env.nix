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
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_THEME,Bibata-Modern-Classic"
        "HYPRCURSOR_SIZE,24"
        "WLR_NO_HARDWARE_CURSORS,1"
        # "AQ_DRM_DEVICES,/dev/dri/card1:/dev/dri/card0"
      ];
    };
  };
}
