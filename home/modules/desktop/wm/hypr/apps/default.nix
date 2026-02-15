{
  config,
  lib,
  pkgs,
  osConfig,
  ...
}: let
  osCfg = osConfig.modules.desktop.wm.hypr;
  cfg = config.hmModules.desktop.wm.hypr.land;
in {
  imports = [
    ./mako.nix
    ./swayosd.nix
    ./waybar.nix
  ];

  config = lib.mkIf (osCfg.enable && cfg.enable) {
    home.packages = with pkgs; [
      overskride
      networkmanagerapplet
      # walker
      hyprlauncher
    ];

    # wayland.windowManager.hyprland.settings = {
    #   exec-once = [
    #     "walker --gapplication-service"
    #   ];
    # };
  };
}
