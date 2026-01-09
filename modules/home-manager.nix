{ self, ... }:
{
  flake.homeManagerModules = {
    default =
      {
        config,
        pkgs,
        lib,
        ...
      }:
      let
        inherit (pkgs.stdenv.hostPlatform) system;
        inherit (lib)
          mkEnableOption
          mkOption
          types
          mkIf
          ;
      in
      {
        options.programs.vimiranie = {
          enable = mkEnableOption "vimiranie";
          settings = {
            stylix = {
              enable = mkEnableOption "stylix colors";
            };
            colorscheme = {
              enable = mkEnableOption "colorscheme package";
              name = mkOption {
                type = types.enum [ "catppuccin" ];
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

        config.home.packages =
          let
            inherit (config.programs.vimiranie) settings;
            nixvim-package = self.packages.${system}.default;
            nixvim-with-target =
              if settings.stylix.enable then
                nixvim-package.extend config.stylix.targets.nixvim.exportedModule
              else
                nixvim-package;
            nixvim-extended = nixvim-with-target.extend {
              vimiranie = {
                inherit (config.programs.vimiranie) enable;
                settings = {
                  stylix = {
                    enable = settings.stylix.enable;
                    colors = config.lib.stylix.colors;
                  };
                  colorscheme = settings.colorscheme;
                  obsidian = settings.obsidian;
                };
              };
            };
          in
          mkIf config.programs.vimiranie.enable [ nixvim-extended ];
      };
  };
}
