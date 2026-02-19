{
  osConfig,
  lib,
  ...
}: let
  osCfg = osConfig.modules.gui.wm.hypr;
in {
  config = lib.mkIf osCfg.enable {
    services.hyprsunset = {
      enable = true;
      # settings = {
      #   profile = [
      #     {
      #       time = "6:00";
      #       temperature = 6500;
      #       identity = true;
      #     }
      #     {
      #       time = "20:00";
      #       temperature = 4000;
      #     }
      #   ];
      # };
    };
  };
}
