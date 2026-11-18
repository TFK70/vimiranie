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
    {
      system,
      pkgs,
      ...
    }:
    let
      nixvim = inputs.nixvim.legacyPackages.${system}.makeNixvimWithModule {
        inherit system;
        module = self.nixvimModules.default;
      };
      namedPackage =
        name: drv:
        pkgs.runCommand name
          {
            meta.mainProgram = name;
            # raw nixvim package with `extend`, used by the home-manager module
            passthru.nixvim = drv;
          }
          ''
            mkdir -p $out/bin
            ln -s ${drv}/bin/nvim $out/bin/${name}
          '';
    in
    {
      packages = {
        default = namedPackage "vimiranie" nixvim;
        lsp =
          namedPackage "vimiranie-lsp"
            (nixvim.extend { vimiranie.settings.lsp.enable = true; });
      };
    };
}
