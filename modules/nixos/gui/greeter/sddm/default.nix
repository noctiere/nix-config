{
  pkgs,
  config,
  lib,
  ...
}: let
  # sddmTheme = import ./sddm-theme.nix {inherit pkgs;};
  cfg = config.modules.gui.greeter.sddm;
in {
  options.modules.gui.greeter.sddm.enable = lib.mkEnableOption "Enable SDDM greeter";

  config = lib.mkIf cfg.enable {
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;

      # theme = "${sddmTheme}";
      theme = "sddm-astronaut-theme";
      # extraPackages = with pkgs; [
      #   sddm-astronaut
      # ];
    };

    qt.enable = true;

    environment.systemPackages = with pkgs; [
      # For ./sddm-theme
      # libsForQt5.qt5.qtquickcontrols2
      # libsForQt5.qt5.qtgraphicaleffects

      sddm-astronaut
      kdePackages.qtmultimedia
    ];
  };
}
