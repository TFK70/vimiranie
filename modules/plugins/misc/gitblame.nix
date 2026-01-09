{
  flake.modules.nixvim.gitblame = {
    plugins = {
      gitblame = {
        enable = true;
        settings = {
          highlight_group = "CursorLine";
        };
      };
    };
  };
}
