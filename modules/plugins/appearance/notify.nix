{ inputs, ... }:
{
  flake.modules.nixvim.notify = {
    plugins = {
      notify = {
        enable = true;
        settings = {
          timeout = 4000;
          stages = "static";
        };
      };
    };

    keymaps = [
      {
        key = "<leader>sn";
        mode = "n";
        action = inputs.nixvim.lib.nixvim.mkRaw ''
          function()
            require('telescope').extensions.notify.notify()
          end
        '';
        options = {
          desc = "Telescope [S]earch [N]otifications";
        };
      }
    ];
  };
}
