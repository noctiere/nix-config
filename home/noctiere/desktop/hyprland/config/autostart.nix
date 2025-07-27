{
  osConfig,
  lib,
  ...
}: let
  cfg = osConfig.windowManager;
in {
  config = lib.mkIf (cfg.enable && cfg.hyprland.enable) {
    wayland.windowManager.hyprland.settings = {
      exec-once = [
        "telegram-desktop -startintray"
        "waybar"
      ];
    };
  };
}
