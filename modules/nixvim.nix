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
      packages = {
        default = inputs.nixvim.legacyPackages.${system}.makeNixvimWithModule {
          inherit system;
          module = self.nixvimModules.default;
        };
      };
    };
}
