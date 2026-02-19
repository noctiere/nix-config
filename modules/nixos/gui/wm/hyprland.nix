{
  pkgs,
  inputs,
  config,
  lib,
  ...
}: let
  cfg = config.modules.gui.wm.hypr;
in {
  options.modules.gui.wm.hypr.enable = lib.mkEnableOption "Whether to enable Hyprland, the dynamic tiling Wayland compositor that doesn’t sacrifice on its looks";

  config = lib.mkIf cfg.enable {
    modules.gui.greeter.tuigreet = {
      enable = true;
      # defaultSessionCmd = "uwsm start -e -D Hyprland hyprland.desktop";
    };

    programs.hyprland = {
      enable = true;
      withUWSM = true;
      # set the flake package
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      # make sure to also set the portal package, so that they are in sync
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };

    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = [
        # pkgs.xdg-desktop-portal-gtk
      ];
    };

    services = {
      gvfs.enable = true;
      # devmon.enable = true;
      udisks2.enable = true;
      upower.enable = true;
      # power-profiles-daemon.enable = true;
      # accounts-daemon.enable = true;
      gnome = {
        # evolution-data-server.enable = true;
        # glib-networking.enable = true;
        gnome-keyring.enable = true;
        # gnome-online-accounts.enable = true;
        # localsearch.enable = true;
        # tinysparql.enable = true;
      };
    };

    environment.systemPackages = with pkgs; [
      # loupe
      nautilus
      baobab
      # gnome-text-editor
      # gnome-calendar
      # gnome-boxes
      # gnome-system-monitor
      # gnome-control-center
      # gnome-weather
      gnome-calculator
      # gnome-clocks
      # gnome-software # for flatpak
      brightnessctl
      wl-clipboard
      # wl-gammactl
    ];

    programs.nautilus-open-any-terminal = {
      enable = true;
      terminal = "wezterm";
    };
  };
}
