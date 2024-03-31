{
  programs.nixvim.plugins.barbar = {
    enable = true;
    keymaps = {
      silent = true;

      next = "<S-l>";
      previous = "<S-h>";
      close = "<leader>bc";
    };
  };
}
