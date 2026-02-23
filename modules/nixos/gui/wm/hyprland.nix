{
  pkgs,
  inputs,
  config,
  lib,
  ...
}: let
  pkgs-unstable = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};

  cfg = config.modules.gui.wm.hypr;
in {
  options.modules.gui.wm.hypr.enable = lib.mkEnableOption "Whether to enable Hyprland, the dynamic tiling Wayland compositor that doesn’t sacrifice on its looks";

  config = lib.mkIf cfg.enable {
    modules.gui.greeter.tuigreet.enable = true;

    # If you start experiencing lag and FPS drops in games or programs like Blender on stable NixOS when using the Hyprland flake, it is most likely a mesa version mismatch between your system and Hyprland.
    # You can fix this issue by using mesa from Hyprland’s nixpkgs input:
    hardware.graphics = lib.mkForce {
      package = pkgs-unstable.mesa;

      # if you also want 32-bit support (e.g for Steam)
      enable32Bit = true;
      package32 = pkgs-unstable.pkgsi686Linux.mesa;
    };

    programs.hyprland = {
      enable = true;
      withUWSM = true;
      # set the flake package
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      # make sure to also set the portal package, so that they are in sync
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };

    xdg = {
      autostart.enable = lib.mkDefault true;
      menus.enable = lib.mkDefault true;
      mime.enable = lib.mkDefault true;
      icons.enable = lib.mkDefault true;
    };

    xdg.portal = {
      enable = true;

      config = {
        common = {
          # Use xdg-desktop-portal-gtk for every portal interface...
          default = [
            "gtk"
            # "gnome"
          ];
        };
      };

      # Sets environment variable NIXOS_XDG_OPEN_USE_PORTAL to 1
      # This will make xdg-open use the portal to open programs,
      # which resolves bugs involving programs opening inside FHS envs or with unexpected env vars set from wrappers.
      # xdg-open is used by almost all programs to open a unknown file/uri
      # alacritty as an example, it use xdg-open as default, but you can also custom this behavior
      # and vscode has open like `External Uri Openers`
      xdgOpenUsePortal = true;

      # ls /run/current-system/sw/share/xdg-desktop-portal/portals/
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk # for provides file picker / OpenURI
        # xdg-desktop-portal-gnome # for screensharing
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
