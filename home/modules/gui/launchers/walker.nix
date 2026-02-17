{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.hmModules.gui.launchers.walker;
in {
  options.hmModules.gui.launchers.walker = {
    enable = lib.mkEnableOption "Whether to enable Walker - Multi-Purpose Launcher with a lot of features";
  };

  config = lib.mkIf cfg.enable {
    services.walker = {
      enable = true;
    };

    home.packages = with pkgs; [
      elephant
    ];
  };
}
