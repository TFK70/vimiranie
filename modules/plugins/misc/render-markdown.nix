{
  flake.modules.nixvim.render-markdown = {
    plugins = {
      render-markdown = {
        enable = true;
        settings = {
          file_types = [
            "markdown"
          ];
        };
      };
    };
  };
}
