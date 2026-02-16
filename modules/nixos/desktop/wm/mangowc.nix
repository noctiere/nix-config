{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.desktop.wm.mangowc;
in {
  imports = [
    inputs.mangowc.nixosModules.mango
  ];
  options.modules.desktop.wm.mangowc.enable = lib.mkEnableOption "Whether to enable MangoWC - Lightweight and feature-rich Wayland compositor based on dwl.";

  config = lib.mkIf cfg.enable {
    modules.desktop.greeter.tuigreet = {
      enable = true;
      defaultSessionCmd = "mango";
    };

    programs.mango.enable = true;

    programs.foot.enable = true;

    xdg.portal = {
      enable = true;
      wlr.enable = true;
      xdgOpenUsePortal = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
      ];
    };
  };
}
