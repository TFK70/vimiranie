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
        inherit (config.programs.vimiranie) settings;

        nixvim-package = self.packages.${system}.default.nixvim;
        nixvim-with-target =
          if settings.stylix.enable then
            nixvim-package.extend config.stylix.targets.nixvim.exportedModule
          else
            nixvim-package;
        nixvim-extended = nixvim-with-target.extend {
          vimiranie = {
            inherit (config.programs.vimiranie) enable;
            settings = {
              lsp = {
                enable = false;
              };
              stylix = {
                enable = settings.stylix.enable;
                colors = config.lib.stylix.colors;
              };
              colorscheme = settings.colorscheme;
              obsidian = settings.obsidian;
              supermaven = settings.supermaven;
            };
          };
        };

        nixvim-extended-with-lsps = nixvim-with-target.extend {
          vimiranie = {
            inherit (config.programs.vimiranie) enable;
            settings = {
              lsp = {
                enable = true;
              };
              stylix = {
                enable = settings.stylix.enable;
                colors = config.lib.stylix.colors;
              };
              colorscheme = settings.colorscheme;
              obsidian = settings.obsidian;
              supermaven = settings.supermaven;
            };
          };
        };
        namedPackage =
          name: drv:
          pkgs.runCommand name
            {
              meta.mainProgram = name;
            }
            ''
              mkdir -p $out/bin
              ln -s ${drv}/bin/nvim $out/bin/${name}
            '';
      in
      {
        options.programs.vimiranie = {
          enable = mkEnableOption "vimiranie";
          package = mkOption {
            type = types.package;
          };
          packageWithLsps = mkOption {
            type = types.package;
          };
          settings = {
            stylix = {
              enable = mkEnableOption "stylix colors";
            };
            colorscheme = {
              enable = mkEnableOption "colorscheme package";
              name = mkOption {
                type = types.str;
              };
            };
            obsidian = {
              enable = mkEnableOption "obsidian";
              vaultFolder = mkOption {
                type = types.str;
                default = "";
              };
            };
            supermaven = {
              enable = mkEnableOption "supermaven";
            };
          };
        };

        config.programs.vimiranie.package = nixvim-extended;
        config.programs.vimiranie.packageWithLsps = nixvim-extended-with-lsps;
        config.home.packages =
          mkIf config.programs.vimiranie.enable
          [
            (namedPackage "vimiranie" nixvim-extended)
            (namedPackage "vimiranie-lsp" nixvim-extended-with-lsps)
          ];
      };
  };
}
