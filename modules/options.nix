{
  flake.modules.nixvim.options =
    { config, lib, ... }:
    let
      inherit (lib) mkEnableOption mkOption types;
    in
    {
      options.vimiranie = {
        enable = mkEnableOption "vimiranie";
        settings = {
          stylix = {
            enable = mkEnableOption "stylix colors";
            colors = mkOption {
              type = types.attrs;
            };
          };
          colorscheme = {
            enable = mkOption {
              type = types.bool;
              description = "colorscheme package";
              default = true;
            };
            name = mkOption {
              type = types.enum [ "catppuccin" ];
              default = "catppuccin";
            };
          };
          obsidian = {
            enable = mkEnableOption "obsidian";
            vaultFolder = mkOption {
              type = types.str;
              default = "";
            };
          };
        };
      };
    };
}
