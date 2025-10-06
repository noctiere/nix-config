{
  osConfig,
  lib,
  ...
}: let
  cfg = osConfig.modules.wm;
in {
  config = lib.mkIf (cfg.enable && cfg.hyprland.enable) {
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
