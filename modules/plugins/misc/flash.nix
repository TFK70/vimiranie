{ inputs, ... }:
{
  flake.modules.nixvim.flash = {
    plugins = {
      flash = {
        enable = true;
      };
    };

    keymaps = [
      {
        key = "zx";
        action = inputs.nixvim.lib.nixvim.mkRaw ''
          function()
            require('flash').jump()
          end
        '';
        options = {
          desc = "Flash";
        };
        mode = [
          "n"
          "x"
          "o"
        ];
      }
    ];
  };
}
