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
    # default.imports = [ config.flake.modules.nixvim.telescope ];
  };

  perSystem =
    { system, ... }:
    {
      nixvimConfigurations = {
        default = inputs.nixvim.lib.evalNixvim {
          inherit system;
          modules = [
            self.nixvimModules.default
          ];
        };
      };
    };
}
