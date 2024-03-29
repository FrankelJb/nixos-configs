{
  programs.nixvim = {
    plugins.gitsigns = {
      enable = true;
      settings.signs = {
        add = {text = "▎";};
        change = {text = "▎";};
        delete = {text = "";};
        topdelete = {text = "";};
        changedelete = {text = "▎";};
        untracked = {text = "▎";};
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "]h";
        action = ":Gitsigns next_hunk<CR>";
        options.desc = "Next Hunk";
      }
      {
        mode = "n";
        key = "[h";
        action = ":Gitsigns prev_hunk<CR>";
        options.desc = "Prev Hunk";
      }
      {
        mode = ["n" "v"];
        key = "<leader>ghs";
        action = ":Gitsigns stage_hunk<CR>";
        options.desc = "Stage Hunk";
      }
      {
        mode = ["n" "v"];
        key = "<leader>ghr";
        action = ":Gitsigns reset_hunk<CR>";
        options.desc = "Reset Hunk";
      }
      {
        mode = "n";
        key = "<leader>ghS";
        action = ":Gitsigns stage_buffer<CR>";
        options.desc = "Stage Buffer";
      }
      {
        mode = "n";
        key = "<leader>ghu";
        action = ":Gitsigns undo_stage_hunk<CR>";
        options.desc = "Undo Stage Hunk";
      }
      {
        mode = "n";
        key = "<leader>ghR";
        action = ":Gitsigns reset_buffer<CR>";
        options.desc = "Reset Buffer";
      }
      {
        mode = "n";
        key = "<leader>ghp";
        action = ":Gitsigns preview_hunk_inline<CR>";
        options.desc = "Preview Hunk Inline";
      }
      {
        mode = "n";
        key = "<leader>ghb";
        action = ":Gitsigns blame_line<CR>";
        options.desc = "Blame Line";
      }
      {
        mode = "n";
        key = "<leader>ghd";
        action = ":Gitsigns diffthis<CR>";
        options.desc = "Diff This";
      }
      {
        mode = "n";
        key = "<leader>ghD";
        action = ":Gitsigns diffthis(\"~\") <CR>";
        options.desc = "Diff This ~";
      }
      {
        mode = ["o" "x"];
        key = "ih";
        action = ":Gitsigns select_hunk<CR>";
        options.desc = "GitSigns Select Hunk";
      }
    ];
  };
}
