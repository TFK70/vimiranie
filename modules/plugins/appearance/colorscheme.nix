{
  flake.modules.nixvim.colorscheme =
    { config, lib, ... }:
    let
      inherit (config.vimiranie) settings;
    in
    {
      assertions = [
        {
          assertion = settings.colorscheme.enable -> settings.stylix.enable == false;
          message = "cannot use colorscheme package with stylix enabled";
        }
      ];

      colorschemes = lib.mkIf settings.colorscheme.enable {
        catppuccin = {
          enable = lib.mkIf (settings.colorscheme.name == "catppuccin") true;
        };
      };
    };
}
