{
  flake.modules.nixvim.lualine =
    { config, lib, ... }:
    let
      triangle = "󰕣";
    in
    {
      plugins = {
        lualine = {
          enable = true;

          settings = {
            options = {
              global_status = true;
              theme =
                let
                  inherit (config.vimiranie.settings.stylix) enable colors;
                in
                lib.mkIf enable rec {
                  normal = {
                    a = {
                      fg = colors.withHashtag.base06;
                      gui = "bold";
                    };
                    b = {
                      fg = colors.withHashtag.base06;
                    };
                    c = {
                      fg = colors.withHashtag.base06;
                    };
                    x = {
                      gui = "bold";
                    };
                    z = {
                      fg = colors.withHashtag.base06;
                    };
                  };

                  insert = {
                    a = {
                      fg = colors.withHashtag.base08;
                    };
                    z = {
                      fg = colors.withHashtag.base06;
                    };
                  };

                  visual = {
                    a = {
                      fg = colors.withHashtag.base0A;
                      gui = "bold";
                    };
                    z = {
                      fg = colors.withHashtag.base06;
                    };
                  };

                  replace = {
                    a = {
                      fg = colors.withHashtag.base0C;
                      gui = "bold";
                    };
                    z = {
                      fg = colors.withHashtag.base06;
                    };
                  };

                  command = {
                    a = {
                      fg = colors.withHashtag.base0D;
                      gui = "bold";
                    };
                    z = {
                      fg = colors.withHashtag.base06;
                    };
                  };

                  inactive = {
                    a = {
                      fg = colors.withHashtag.base04;
                      bg = colors.withHashtag.base00;
                    };
                  };
                };
              component_separators = " ";
            };

            sections = {
              lualine_a = [
                {
                  __raw = ''
                    function()
                      local mode_map = {
                        ["n"] = "NORMAL",
                        ["no"] = "O-PENDING",
                        ["nov"] = "O-PENDING",
                        ["noV"] = "O-PENDING",
                        ["niI"] = "NORMAL",
                        ["niR"] = "NORMAL",
                        ["niV"] = "NORMAL",
                        ["nt"] = "NORMAL",
                        ["v"] = "VISUAL",
                        ["vs"] = "VISUAL",
                        ["V"] = "V-LINE",
                        ["Vs"] = "V-LINE",
                        ["s"] = "SELECT",
                        ["S"] = "S-LINE",
                        ["i"] = "INSERT",
                        ["ic"] = "INSERT",
                        ["ix"] = "INSERT",
                        ["R"] = "REPLACE",
                        ["Rc"] = "REPLACE",
                        ["Rx"] = "REPLACE",
                        ["Rv"] = "V-REPLACE",
                        ["Rvc"] = "V-REPLACE",
                        ["Rvx"] = "V-REPLACE",
                        ["c"] = "COMMAND",
                        ["cv"] = "EX",
                        ["ce"] = "EX",
                        ["r"] = "REPLACE",
                        ["rm"] = "MORE",
                        ["r?"] = "CONFIRM",
                        ["!"] = "SHELL",
                        ["t"] = "TERMINAL",
                      }

                      local reg = vim.fn.reg_recording()
                      if reg == "" then
                        return "${triangle} " .. mode_map[vim.api.nvim_get_mode().mode]
                      end

                      return "${triangle} " .. "RECORDING: " .. reg
                    end,
                  '';
                }
              ];

              lualine_b = [ "branch" ];
              lualine_c = [ ];
              lualine_x = [
                {
                  __raw = ''
                    function()
                      local msg = "LSP Inactive"
                      local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
                      local clients = vim.lsp.get_clients()
                      if next(clients) == nil then
                        return msg
                      end
                      for _, client in ipairs(clients) do
                        local filetypes = client.config.filetypes
                        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                          return "[" .. client.name .. "]"
                        end
                      end
                      return msg
                    end,
                  '';
                }
              ];
              lualine_y = [
                "filetype"
                "progress"
              ];
              lualine_z = [
                {
                  location = { };
                  left_padding = 2;
                }
              ];
            };

            inactive_sections = {
              lualine_a = [ ];
              lualine_b = [ ];
              lualine_c = [ ];
              lualine_x = [ ];
              lualine_y = [ ];
              lualine_z = [ ];
            };

            tabline = { };
            extensions = [
              "quickfix"
              "man"
              "fugitive"
            ];
          };
        };
      };
    };
}
