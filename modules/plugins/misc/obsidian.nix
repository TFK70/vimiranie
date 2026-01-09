{ inputs, ... }:
{
  flake.modules.nixvim.obsidian =
    { config, lib, ... }:
    let
      inherit (config.vimiranie) settings;
      inherit (config.vimiranie.settings.obsidian) vaultFolder;
    in
    lib.mkIf settings.obsidian.enable {
      assertions = [
        {
          assertion = vaultFolder != "";
          message = "obsidian vault folder is not set";
        }
      ];
      plugins = {
        obsidian = {
          enable = true;
          settings = {
            legacy_commands = false;
            workspaces = [
              {
                name = "default";
                path = vaultFolder;
              }
            ];
            templates = {
              folder = "_templates";
              date_format = "%Y-%m-%d";
              time_format = "%H:%M";
            };
            ui = {
              enable = false;
            };

            frontmatter = {
              enabled = true;
              func = inputs.nixvim.lib.nixvim.mkRaw ''
                function(note)
                  if note.hubs == nil then
                    note.hubs = {}
                  end
                  local out = { id = note.id, tags = note.tags, hubs = note.hubs }

                  if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
                    for k, v in pairs(note.metadata) do
                      out[k] = v
                    end
                  end

                  return out
                end
              '';
            };
            note_id_func = inputs.nixvim.lib.nixvim.mkRaw ''
              function(title)
                return os.date("%Y-%m-%d") .. "-" .. title
              end
            '';
            notes_subdir = "Inbox";
            new_notes_location = "notes_subdir";
            follow_url_func = inputs.nixvim.lib.nixvim.mkRaw ''
              function(url)
                vim.fn.jobstart({ "xdg-open", url }) -- linux
              end
            '';
            follow_img_func = inputs.nixvim.lib.nixvim.mkRaw ''
              function(img)
                vim.fn.jobstart({ "xdg-open", img }) -- linux
              end
            '';
          };
        };
      };
      keymaps = [
        {
          key = "<leader>osf";
          mode = "n";
          action = inputs.nixvim.lib.nixvim.mkRaw ''
            function()
              require("telescope.builtin").find_files({ cwd = "${vaultFolder}" })
            end
          '';
          options = {
            desc = "[O]bsidian [S]earch [F]ile notes with Telescope";
          };
        }
        {
          key = "<leader>ost";
          mode = "n";
          action = inputs.nixvim.lib.nixvim.mkRaw ''
            function()
              require("telescope.builtin").live_grep({ cwd = "${vaultFolder}" })
            end
          '';
          options = {
            desc = "[O]bsidian [S]earch live grep notes with Telescope";
          };
        }
        {
          key = "<leader>onn";
          mode = "n";
          action = inputs.nixvim.lib.nixvim.mkRaw ''
            function()
              vim.ui.input({ prompt = "Note title:" }, function(input)
                vim.cmd("Obsidian new " .. input)
              end)
            end
          '';
          options = {
            desc = "[O]bsidian [N]ew [N]ote";
          };
        }
        {
          key = "<leader>onn";
          mode = "n";
          action = inputs.nixvim.lib.nixvim.mkRaw ''
            function()
              vim.ui.input({ prompt = "Note title:" }, function(input)
                vim.cmd("Obsidian new " .. input)
              end)
            end
          '';
          options = {
            desc = "[O]bsidian [N]ew [N]ote";
          };
        }
      ];
    };
}
