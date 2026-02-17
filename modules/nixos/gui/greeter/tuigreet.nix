{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.modules.gui.greeter.tuigreet;
in {
  options.modules.gui.greeter.tuigreet = {
    enable = lib.mkEnableOption "Enable tuigreet - Graphical console greeter for greetd";
    defaultSessionCmd = lib.mkOption {
      default = "";
      description = "command to run on system startup after login";
      type = lib.types.str;
    };
  };

  config = lib.mkIf cfg.enable {
    services.greetd = {
      enable = true;
      useTextGreeter = true;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time${
            if (cfg.defaultSessionCmd != "")
            then " --cmd '${cfg.defaultSessionCmd}'"
            else ""
          }";
          user = "greeter";
        };
      };
    };
  };
}
