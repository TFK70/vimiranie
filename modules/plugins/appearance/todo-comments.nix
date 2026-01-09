{
  flake.modules.nixvim.todo-comments = {
    plugins = {
      todo-comments = {
        enable = true;
        settings = {
          signs = false;
        };
      };
    };
  };
}
