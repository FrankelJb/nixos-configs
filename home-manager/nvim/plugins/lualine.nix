{
  programs.nixvim.plugins.lualine = {
    enable = true;

    globalstatus = true;

    # +-------------------------------------------------+
    # | A | B | C                             X | Y | Z |
    # +-------------------------------------------------+
    sections = {
      lualine_a = ["mode"];
      lualine_b = ["branch"];
      lualine_c = ["filename" "diff"];

      lualine_x = [
        {
          # TODO: get this lualine recording working again
          name.__raw = ''
            function()
              return require("noice").api.status.command.get()
            end
          '';
          color.fg = "#ffffff";
        }
        "encoding"
        "fileformat"
        "filetype"
      ];
    };
  };
}
