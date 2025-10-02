{
  osConfig,
  config,
  lib,
  ...
}: let
  cfg = osConfig.windowManager;
in {
  config = lib.mkIf (cfg.enable && cfg.hyprland.enable) {
    services.hyprsunset = {
      enable = true;
      settings = {
        profile = [
          {
            time = "6:00";
            temperature = 6500;
            identity = true;
          }
          {
            time = "20:00";
            temperature = 4000;
          }
        ];
      };
    };
  };
}
