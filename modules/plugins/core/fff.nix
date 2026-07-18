# TODO:
# 1. Ошибка при запуске not enough room
# 2. Узнать, как в fff можно сделать поиск по своим данным
#    Нужно заменить <leader>sn для поиска по notify (и т.п.)
{
  flake.modules.nixvim.fff = { lib, ... }: {
    plugins = {
      fff = {
        enable = true;
        autoLoad = true;
        settings = {
          base_path = lib.nixvim.mkRaw "vim.fn.getcwd()";
          prompt_vim_mode = true;
          key_bindings = {
            close = [
              "<Esc>"
            ];
            move_down = [
              "<Down>"
            ];
            move_up = [
              "<Up>"
            ];
            open_split = "<C-s>";
            open_tab = "<C-t>";
            open_vsplit = "<C-v>";
            select_file = "<CR>";
          };
          layout = {
            width = 0.7;
            height = 0.4;
            preview_position = "bottom";
            prompt_position = "top";
          };
          max_results = 100;
        };
      };
    };

    keymaps = [
      {
        key = "<leader>f";
        action = lib.nixvim.mkRaw ''
          function()
            require('fff').find_files({ preview = { enabled = false } })
          end
        '';
      }
      {
        key = "<leader>st";
        action = lib.nixvim.mkRaw ''
          function()
            require('fff').live_grep()
          end
        '';
      }
    ];
  };
}
