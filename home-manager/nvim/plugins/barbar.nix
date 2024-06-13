{
  programs.nixvim.plugins.barbar = {
    enable = true;
    keymaps = {
      next = {
        key = "<S-l>";
      };
      previous = {
        key = "<S-h>";
      };
      close = {
        key = "<leader>bc";
      };
    };
  };
}
