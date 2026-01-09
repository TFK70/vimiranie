{ inputs, ... }:
{
  flake.modules.nixvim.spectre = {
    plugins = {
      spectre = {
        enable = true;
      };
    };

    keymaps = [
      {
        key = "<leader>S";
        mode = "n";
        action = inputs.nixvim.lib.nixvim.mkRaw ''
          function()
            require("spectre").toggle()
          end
        '';
        options = {
          desc = "[S]pectre";
        };
      }
    ];
  };
}
