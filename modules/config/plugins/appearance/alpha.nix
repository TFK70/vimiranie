{
  flake.modules.nixvim.alpha =
    { lib, ... }:
    {
      plugins = {
        alpha = {
          enable = true;
          settings = {
            layout = [
              {
                type = "padding";
                val = 2;
              }
              {
                opts = {
                  hl = "Type";
                  position = "center";
                };
                type = "text";
                val = [
                  "________  ___  ___  ___  __    ________  ________  ________  ________      "
                  "|\\   __  \\|\\  \\|\\  \\|\\  \\|\\  \\ |\\   __  \\|\\   __  \\|\\   __  \\|\\   ____\\     "
                  "\\ \\  \\|\\  \\ \\  \\\\\\  \\ \\  \\/  /|\\ \\  \\|\\  \\ \\  \\|\\ /\\ \\  \\|\\  \\ \\  \\___|_    "
                  " \\ \\   ____\\ \\  \\\\\\  \\ \\   ___  \\ \\   __  \\ \\   __  \\ \\  \\\\\\  \\ \\_____  \\   "
                  "  \\ \\  \\___|\\ \\  \\\\\\  \\ \\  \\\\ \\  \\ \\  \\ \\  \\ \\  \\|\\  \\ \\  \\\\\\  \\|____|\\  \\  "
                  "   \\ \\__\\    \\ \\_______\\ \\__\\\\ \\__\\ \\__\\ \\__\\ \\_______\\ \\_______\\____\\_\\  \\ "
                  "    \\|__|     \\|_______|\\|__| \\|__|\\|__|\\|__|\\|_______|\\|_______|\\_________\\"
                  "                                                                \\|_________|"
                ];
              }
              {
                type = "padding";
                val = 2;
              }
              {
                type = "group";
                val = [
                  {
                    on_press = lib.nixvim.mkRaw "function() vim.cmd[[ene]] end";
                    opts = {
                      shortcut = "n";
                    };
                    type = "button";
                    val = "  New file";
                  }
                  {
                    on_press = lib.nixvim.mkRaw "function() vim.cmd[[qa]] end";
                    opts = {
                      shortcut = "q";
                    };
                    type = "button";
                    val = " Quit Neovim";
                  }
                ];
              }
              {
                type = "padding";
                val = 2;
              }
              {
                opts = {
                  hl = "Keyword";
                  position = "center";
                };
                type = "text";
                val = "Inspiring quote here.";
              }
            ];
          };
        };
      };
    };
}
