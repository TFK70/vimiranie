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
        nixvim-package = self.packages.${system}.default;
        nixvim-with-target = nixvim-package.extend config.stylix.targets.nixvim.exportedModule;
        nixvim-extended = nixvim-with-target.extend {
          vimiranie =
            let
              inherit (config.programs.vimiranie.settings) stylix;
            in
            {
              inherit (config.programs.vimiranie) enable;
              settings = {
                stylix = {
                  enable = stylix.enable;
                  colors = config.lib.stylix.colors;
                };
              };
            };
        };
      in
      {
        options.programs.vimiranie = {
          enable = mkEnableOption "vimiranie";
          settings = {
            stylix = {
              enable = mkEnableOption "stylix colors";
            };
          };
        };

        config.home.packages = mkIf config.programs.vimiranie.enable [ nixvim-extended ];
      };
  };

  flake.modules.nixvim.options =
    { lib, ... }:
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
        };
      };
    };
}
