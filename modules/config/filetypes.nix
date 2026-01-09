{ inputs, ... }:
{
  flake.modules.nixvim.filetypes = {
    filetype = {
      extension = {
        yaml = "yaml";
      };
      pattern = {
        "helmfile.*%.ya?ml" = "helm";
      };
    };
  };
}
