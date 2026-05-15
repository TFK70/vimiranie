{
  flake.modules.nixvim.supermaven =
    { config, ... }:
    let
      inherit (config.vimiranie) settings;
    in
    {
      plugins = {
        supermaven = {
          enable = settings.supermaven.enable;
          settings = {
            keymaps = {
              accept_suggestion = "<A-k>";
              clear_suggestion = "<A-]>";
              accept_word = "<A-j>";
            };
            ignore_filetypes = {
              markdown = true;
              tex = true;
            };
          };
        };
      };
    };
}
