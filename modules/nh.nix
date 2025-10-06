{
  config,
  lib,
  myvars,
  ...
}: let
  inherit (lib) mkEnableOption mkIf mkOption;
  cfg = config.modules.nh;
in {
  options.modules.nh = {
    enable = mkEnableOption "Enable Yet another Nix CLI helper";
    numOfGens = mkOption {
      type = lib.types.str;
      default = "1";
      description = "At least keep this number of generations [default: 1]";
    };
    timeRange = mkOption {
      type = lib.types.str;
      default = "0h";
      description = "At least keep gcroots and generations in this time range since now (in s/h/d) [default: 0h]";
    };
  };

  config = mkIf cfg.enable {
    programs.nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since ${cfg.timeRange} --keep ${cfg.numOfGens}";
        # -k, --keep <KEEP>
        #   At least keep this number of generations [default: 1]
        # -v, --verbose...
        #         Increase logging verbosity
        # -K, --keep-since <KEEP_SINCE>
        #         At least keep gcroots and generations in this time range since now [default: 0h]
        # -q, --quiet...
        #         Decrease logging verbosity
        # -e, --elevation-program <ELEVATION_PROGRAM>
        #         Choose what privilege elevation program should be used [env: NH_ELEVATION_PROGRAM=]
        # -n, --dry
        #         Only print actions, without performing them
        # -a, --ask
        #         Ask for confirmation
        #     --no-gc
        #         Don't run nix store --gc
        #     --no-gcroots
        #         Don't clean gcroots
        #     --optimise
        #         Run nix-store --optimise after gc
        #     --max <MAX>
        #         Pass --max to nix store gc
        # -h, --help
        #         Print help
      flake = "/home/${myvars.username}/nix-config";
    };
  };
}
