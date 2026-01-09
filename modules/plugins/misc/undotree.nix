{ inputs, ... }:
{
  flake.modules.nixvim.undotree = {
    plugins = {
      undotree = {
        enable = true;
      };
    };

    keymaps = [
      {
        key = "<leader>U";
        mode = "n";
        action = inputs.nixvim.lib.nixvim.mkRaw ''
          vim.cmd.UndotreeToggle
        '';
        options = {
          desc = "[U]ndotree";
        };
      }
    ];
  };
}
