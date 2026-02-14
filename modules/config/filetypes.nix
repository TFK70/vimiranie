{ inputs, ... }:
{
  flake.modules.nixvim.filetypes = {
    filetype = {
      extension = {
        yaml = "yaml";
        j2 = "jinja";
      };
      pattern = {
        "helmfile.*%.ya?ml" = "helm";
      };
    };
  };
}
