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
    let
      nixvim = inputs.nixvim.legacyPackages.${system}.makeNixvimWithModule {
        inherit system;
        module = self.nixvimModules.default;
      };
    in
    {
      packages = {
        default = nixvim;
        lsp = nixvim.extend { vimiranie.settings.lsp.enable = true; };
      };
    };
}
