{
  flake.modules.nixvim.blink-cmp = {
    plugins = {
      blink-cmp = {
        enable = true;
        settings = {
          keymap = {
            preset = "none";
            "<C-j>" = [
              "select_next"
              "fallback"
            ];
            "<C-k>" = [
              "select_prev"
              "fallback"
            ];
            "<C-l>" = [
              "show_documentation"
              "fallback"
            ];
            "<CR>" = [
              "accept"
              "fallback"
            ];
          };
          completion = {
            list = {
              selection = {
                preselect = false;
              };
            };
          };
        };
      };
    };
  };
}
