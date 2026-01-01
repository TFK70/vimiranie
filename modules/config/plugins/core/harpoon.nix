{
  flake.modules.nixvim.harpoon = {
      plugins = {
        harpoon = {
          enable = true;
          lazyLoad.settings.keys = [
            {
              __unkeyed-1 = "<leader>sm";
              __unkeyed-2.__raw = ''
                function()
                  require('telescope').extensions.harpoon.marks()
                end
              '';
              desc = "[S]earch [H]arpoon marks with Telescope";
            }
            {
              __unkeyed-1 = "<leader>Ma";
              __unkeyed-2.__raw = ''
                function()
                  require("harpoon.mark").add_file()
                  require('notify')('Harpoon mark added')
                end
              '';
              desc = "Harpoon [M]ark [A]dd";
            }
            {
              __unkeyed-1 = "<leader>Md";
              __unkeyed-2.__raw = ''
                function()
                  require("harpoon.mark").rm_file()
                  require('notify')('Harpoon mark deleted')
                end
              '';
              desc = "Harpoon [M]ark [D]elete";
            }
            {
              __unkeyed-1 = "<leader>Mc";
              __unkeyed-2.__raw = ''
                function()
                  require("harpoon.mark").clear_all()
                  require('notify')('Harpoon marks cleared')
                end
              '';
              desc = "Harpoon [M]arks [C]lear";
            }
            {
              __unkeyed-1 = "<leader>m";
              __unkeyed-2.__raw = ''
                function()
                  require("harpoon.ui").toggle_quick_menu()
                end
              '';
              desc = "Harpoon toggle quick [m]enu";
            }
            {
              __unkeyed-1 = "<leader>1";
              __unkeyed-2.__raw = ''
                function()
                  require("harpoon.ui").nav_file(1)
                end
              '';
              desc = "Harpoon navigate to [1]st file";
            }
            {
              __unkeyed-1 = "<leader>2";
              __unkeyed-2.__raw = ''
                function()
                  require("harpoon.ui").nav_file(2)
                end
              '';
              desc = "Harpoon navigate to [2]nd file";
            }
            {
              __unkeyed-1 = "<leader>3";
              __unkeyed-2.__raw = ''
                function()
                  require("harpoon.ui").nav_file(3)
                end
              '';
              desc = "Harpoon navigate to [3]nd file";
            }
            {
              __unkeyed-1 = "<leader>4";
              __unkeyed-2.__raw = ''
                function()
                  require("harpoon.ui").nav_file(4)
                end
              '';
              desc = "Harpoon navigate to [4]nd file";
            }
            {
              __unkeyed-1 = "<leader>5";
              __unkeyed-2.__raw = ''
                function()
                  require("harpoon.ui").nav_file(5)
                end
              '';
              desc = "Harpoon navigate to [5]nd file";
            }
            {
              __unkeyed-1 = "<leader>6";
              __unkeyed-2.__raw = ''
                function()
                  require("harpoon.ui").nav_file(6)
                end
              '';
              desc = "Harpoon navigate to [6]nd file";
            }
            {
              __unkeyed-1 = "<leader>7";
              __unkeyed-2.__raw = ''
                function()
                  require("harpoon.ui").nav_file(7)
                end
              '';
              desc = "Harpoon navigate to [7]nd file";
            }
            {
              __unkeyed-1 = "<leader>8";
              __unkeyed-2.__raw = ''
                function()
                  require("harpoon.ui").nav_file(8)
                end
              '';
              desc = "Harpoon navigate to [8]nd file";
            }
            {
              __unkeyed-1 = "<leader>9";
              __unkeyed-2.__raw = ''
                function()
                  require("harpoon.ui").nav_file(9)
                end
              '';
              desc = "Harpoon navigate to [9]nd file";
            }
          ];
        };
      };
  };
}
