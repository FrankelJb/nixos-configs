{
  programs.nixvim.plugins.barbar = {
    enable = true;
    keymaps = {
      silent = true;

      next = "<S-h>";
      previous = "<S-h>";
      close = "<leader>bc";
    };
  };
}
