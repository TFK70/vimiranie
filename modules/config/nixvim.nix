{
  inputs,
  config,
  lib,
  self,
  ...
}:
{
  nixvim = {
    packages.enable = true;
    checks.enable = true;
  };

  flake.nixvimModules = {
    default.imports = (lib.attrValues config.flake.modules.nixvim);
  };

  perSystem =
    { system, ... }:
    {
      # nixvimConfigurations = {
      #   default = inputs.nixvim.lib.evalNixvim {
      #     inherit system;
      #     modules = [
      #       self.nixvimModules.default
      #     ];
      #   };
      # };

      packages = {
        default = inputs.nixvim.legacyPackages.${system}.makeNixvimWithModule {
          inherit system;
          module = self.nixvimModules.default;
        };
      };
    };
}
