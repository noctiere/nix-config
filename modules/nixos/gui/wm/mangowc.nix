{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.gui.wm.mangowc;
in {
  imports = [
    inputs.mangowc.nixosModules.mango
  ];
  options.modules.gui.wm.mangowc.enable = lib.mkEnableOption "Whether to enable MangoWC - Lightweight and feature-rich Wayland compositor based on dwl.";

  config = lib.mkIf cfg.enable {
    modules.gui.greeter.tuigreet = {
      enable = true;
      # defaultSessionCmd = "mango";
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
