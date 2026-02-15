{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.hmModules.desktop.gui.editors.zed-editor;
in {
  options.hmModules.desktop.gui.editors.zed-editor = {
    enable = lib.mkEnableOption "Whether to enable Zed, the high performance, multuplayer code editor from the creators of Atom and Tree-sitter";
    extensions = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [];
      description = "Array of conecated strings";
    };
    fontFamily = lib.mkOption {
      type = lib.types.str;
      default = "DejaVu Sans";
      description = "Font family to use [default: DejaVu Sans]";
    };
    fontSize = lib.mkOption {
      type = lib.types.int;
      default = 16;
      description = "Font size to use [default: 16.0]";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.zed-editor = {
      enable = true;
      extensions = ["nix"] ++ cfg.extensions;
      extraPackages = with pkgs; [
        nil
        alejandra
      ];
      userSettings = lib.mkForce {
        languages = {
          Nix = {
            format_on_save = "on";
            language_servers = [
              "nil"
              "!nixd"
            ];
            formatter = {
              external = {
                command = "alejandra";
                arguments = [
                  "--quiet"
                  "--"
                ];
              };
            };
          };
        };
        features = {
          copilot = false;
        };
        telemetry = {
          metrics = false;
        };
        tabs = {
          file_icons = true;
          git_status = true;
        };
        vim_mode = true;
        vim = {
          use_smartcase_find = true;
          use_multiline_find = true;
          toggle_relative_line_numbers = true;
        };
        ui_font_size = cfg.fontSize;
        ui_font_family = cfg.fontFamily;
        buffer_font_size = cfg.fontSize;
        buffer_font_family = "${cfg.fontFamily} Mono";
      };
    };
  };
}
