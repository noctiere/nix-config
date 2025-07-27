{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.windowManager;
in {
  imports = [./sddm];

  options.windowManager.hyprland.enable = lib.mkEnableOption "Hyprland";

  config = lib.mkIf (cfg.enable && cfg.hyprland.enable) {
    programs.hyprland = {
      enable = true;
      withUWSM = true;
    };

    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
      ];
    };

    services = {
      gvfs.enable = true;
      # devmon.enable = true;
      # udisks2.enable = true;
      # upower.enable = true;
      # power-profiles-daemon.enable = true;
      # accounts-daemon.enable = true;
      gnome = {
        # evolution-data-server.enable = true;
        glib-networking.enable = true;
        gnome-keyring.enable = true;
        # gnome-online-accounts.enable = true;
        # localsearch.enable = true;
        # tinysparql.enable = true;
      };
    };

    environment.systemPackages = with pkgs; [
      loupe
      nautilus
      baobab
      gnome-text-editor
      gnome-calendar
      gnome-boxes
      gnome-system-monitor
      gnome-control-center
      gnome-weather
      gnome-calculator
      gnome-clocks
      gnome-software # for flatpak
      brightnessctl
      wl-clipboard
      wl-gammactl
    ];
  };
}
