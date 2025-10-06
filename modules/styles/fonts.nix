{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption;
  cfg = config.modules.styles.fonts;
in {
  options.modules.styles.fonts = {
    enable = mkEnableOption "Enable fonts (nerd + emoji)";
  };

  config = lib.mkIf cfg.enable {
    fonts.packages = with pkgs; [
      nerd-fonts.hack
      nerd-fonts.fira-code
      nerd-fonts.fira-mono
      nerd-fonts.jetbrains-mono
      font-awesome
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
    ];
  };
}
