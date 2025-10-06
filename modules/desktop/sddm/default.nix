{
  pkgs,
  config,
  lib,
  ...
}: let
  sddmTheme = import ./sddm-theme.nix {inherit pkgs;};
  cfg = config.modules.wm;
in {
  config = lib.mkIf cfg.hyprland.enable {
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "${sddmTheme}";
    };

    environment.systemPackages = with pkgs; [
      libsForQt5.qt5.qtquickcontrols2
      libsForQt5.qt5.qtgraphicaleffects
    ];
  };
}
