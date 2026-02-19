{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.hmModules.gui.editors.zed-editor;
in {
  options.hmModules.gui.editors.zed-editor = {
    enable = lib.mkEnableOption "Whether to enable Zed, the high performance, multuplayer code editor from the creators of Atom and Tree-sitter";
    extensions = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [];
      description = "Array of extensions to install";
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
    home.file.".config/zed".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/zed";
    stylix.targets.zed.enable = false;

    programs.zed-editor = {
      enable = true;
      extensions = ["nix" "git-firefly"] ++ cfg.extensions;
      extraPackages = with pkgs; [
        nil
        alejandra
      ];
    };
  };
}
