{
  lib,
  pkgs,
  osConfig,
  ...
}: let
  cfg = osConfig.modules.wm;
in {
  config = lib.mkIf (cfg.enable && cfg.hyprland.enable) {
    home.packages = with pkgs; [
      overskride
      networkmanagerapplet
      walker
    ];
    
    wayland.windowManager.hyprland.settings = {
      exec-once = [
        "walker --gapplication-service"
      ];  
    };
  };
}
