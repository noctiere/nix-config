{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.modules.gui.greeter.tuigreet;
in {
  options.modules.gui.greeter.tuigreet.enable = lib.mkEnableOption "Enable tuigreet - Graphical console greeter for greetd";

  config = lib.mkIf cfg.enable {
    services.greetd = {
      enable = true;
      useTextGreeter = true;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time --sessions ${config.services.displayManager.sessionData.desktops}/share/wayland-sessions --remember --remember-user-session --asterisks --window-padding 2";
          user = "greeter";
        };
      };
    };
  };
}
