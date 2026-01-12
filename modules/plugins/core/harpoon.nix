{ inputs, ... }:
{
  flake.modules.nixvim.harpoon = {
    plugins = {
      harpoon = {
        enable = true;
      };
    };

    keymaps = [
      {
        key = "<leader>sm";
        action = inputs.nixvim.lib.nixvim.mkRaw ''
          function()
            require('telescope').extensions.harpoon.marks()
          end
        '';
        options = {
          desc = "[S]earch [H]arpoon marks with Telescope";
        };
        mode = [
          "n"
        ];
      }

      {
        key = "<leader>Ma";
        action = inputs.nixvim.lib.nixvim.mkRaw ''
          function()
            require'harpoon':list():add()
            require('notify')('Harpoon mark added')
          end
        '';
        options = {
          desc = "Harpoon [M]ark [A]dd";
        };
        mode = [ "n" ];
      }
      {
        key = "<leader>m";
        action = inputs.nixvim.lib.nixvim.mkRaw ''
          function()
            require'harpoon'.ui:toggle_quick_menu(require'harpoon':list())
          end
        '';
        options = {
          desc = "Harpoon toggle quick [m]enu";
        };
        mode = [ "n" ];
      }
      {
        key = "<leader>1";
        action = inputs.nixvim.lib.nixvim.mkRaw ''
          function()
            require'harpoon':list():select(1)
          end
        '';
        options = {
          desc = "Harpoon navigate to [1]st file";
        };
        mode = [ "n" ];
      }
      {
        key = "<leader>2";
        action = inputs.nixvim.lib.nixvim.mkRaw ''
          function()
            require'harpoon':list():select(2)
          end
        '';
        options = {
          desc = "Harpoon navigate to [2]nd file";
        };
        mode = [ "n" ];
      }
      {
        key = "<leader>3";
        action = inputs.nixvim.lib.nixvim.mkRaw ''
          function()
            require'harpoon':list():select(3)
          end
        '';
        options = {
          desc = "Harpoon navigate to [3]rd file";
        };
        mode = [ "n" ];
      }
      {
        key = "<leader>4";
        action = inputs.nixvim.lib.nixvim.mkRaw ''
          function()
            require'harpoon':list():select(4)
          end
        '';
        options = {
          desc = "Harpoon navigate to [4]th file";
        };
        mode = [ "n" ];
      }
      {
        key = "<leader>5";
        action = inputs.nixvim.lib.nixvim.mkRaw ''
          function()
            require'harpoon':list():select(5)
          end
        '';
        options = {
          desc = "Harpoon navigate to [5]th file";
        };
        mode = [ "n" ];
      }
      {
        key = "<leader>6";
        action = inputs.nixvim.lib.nixvim.mkRaw ''
          function()
            require'harpoon':list():select(6)
          end
        '';
        options = {
          desc = "Harpoon navigate to [6]th file";
        };
        mode = [ "n" ];
      }
      {
        key = "<leader>7";
        action = inputs.nixvim.lib.nixvim.mkRaw ''
          function()
            require'harpoon':list():select(7)
          end
        '';
        options = {
          desc = "Harpoon navigate to [7]th file";
        };
        mode = [ "n" ];
      }
      {
        key = "<leader>8";
        action = inputs.nixvim.lib.nixvim.mkRaw ''
          function()
            require'harpoon':list():select(8)
          end
        '';
        options = {
          desc = "Harpoon navigate to [8]th file";
        };
        mode = [ "n" ];
      }
      {
        key = "<leader>9";
        action = inputs.nixvim.lib.nixvim.mkRaw ''
          function()
            require'harpoon':list():select(9)
          end
        '';
        options = {
          desc = "Harpoon navigate to [9]th file";
        };
        mode = [ "n" ];
      }
    ];
  };
}
