{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.theme.fonts;
in {
  options.modules.theme.fonts.enable = lib.mkEnableOption "Enable fonts (nerd + emoji)";

  config = lib.mkIf cfg.enable {
    fonts.packages = with pkgs; [
      nerd-fonts.hack
      nerd-fonts.fira-code
      nerd-fonts.fira-mono
      nerd-fonts.jetbrains-mono
      font-awesome
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
    ];
  };
}
