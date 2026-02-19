{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.theme.fonts;
in {
  options.modules.theme.fonts = {
    enable = lib.mkEnableOption "Enable fonts (nerd + emoji)";

    extraFontsPkgs = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = [];
      description = "List of extra fonts packages to install";
    };
  };

  config = lib.mkIf cfg.enable {
    fonts.packages =
      cfg.extraFontsPkgs
      ++ (with pkgs; [
        nerd-fonts.hack
        nerd-fonts.fira-code
        nerd-fonts.fira-mono
        nerd-fonts.jetbrains-mono
        nerd-fonts.caskaydia-cove
        font-awesome
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-color-emoji
      ]);
  };
}
