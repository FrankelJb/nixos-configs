{
  programs.nixvim = {
    plugins.yanky = {
      enable = true;
      ring = {
        storage = "sqlite";
      };
      extraOptions = {
        highlight = {
          timer = 250;
        };
      };
    };
    keymaps = [
      {
        key = "<leader>p";
        action = "function() require(\"telescope\").extensions.yank_history.yank_history() end";
        lua = true;
        options.desc = "Open Yank History";
      }
      {
        key = "y";
        action = "<Plug>(YankyYank)";
        mode = ["n" "x"];
        options.desc = "Yank Text";
      }
      {
        key = "p";
        action = "<Plug>(YankyPutAfter)";
        mode = ["n" "x"];
        options.desc = "Put Yanked Text After Cursor";
      }
      {
        key = "P";
        action = "<Plug>(YankyPutBefore)";
        mode = ["n" "x"];
        options.desc = "Put Yanked Text Before Cursor";
      }
      {
        key = "gp";
        action = "<Plug>(YankyGPutAfter)";
        mode = ["n" "x"];
        options.desc = "Put Yanked Text After Selection";
      }
      {
        key = "gP";
        action = "<Plug>(YankyGPutBefore)";
        mode = ["n" "x"];
        options.desc = "Put Yanked Text Before Selection";
      }
      {
        key = "[y";
        action = "<Plug>(YankyCycleForward)";
        options.desc = "Cycle Forward Through Yank History";
      }
      {
        key = "]y";
        action = "<Plug>(YankyCycleBackward)";
        options.desc = "Cycle Backward Through Yank History";
      }
      {
        key = "]p";
        action = "<Plug>(YankyPutIndentAfterLinewise)";
        options.desc = "Put Indented After Cursor (Linewise)";
      }
      {
        key = "[p";
        action = "<Plug>(YankyPutIndentBeforeLinewise)";
        options.desc = "Put Indented Before Cursor (Linewise)";
      }
      {
        key = "]P";
        action = "<Plug>(YankyPutIndentAfterLinewise)";
        options.desc = "Put Indented After Cursor (Linewise)";
      }
      {
        key = "[P";
        action = "<Plug>(YankyPutIndentBeforeLinewise)";
        options.desc = "Put Indented Before Cursor (Linewise)";
      }
      {
        key = ">p";
        action = "<Plug>(YankyPutIndentAfterShiftRight)";
        options.desc = "Put and Indent Right";
      }
      {
        key = "<p";
        action = "<Plug>(YankyPutIndentAfterShiftLeft)";
        options.desc = "Put and Indent Left";
      }
      {
        key = ">P";
        action = "<Plug>(YankyPutIndentBeforeShiftRight)";
        options.desc = "Put Before and Indent Right";
      }
      {
        key = "<P";
        action = "<Plug>(YankyPutIndentBeforeShiftLeft)";
        options.desc = "Put Before and Indent Left";
      }
      {
        key = "=p";
        action = "<Plug>(YankyPutAfterFilter)";
        options.desc = "Put After Applying a Filter";
      }
      {
        key = "=P";
        action = "<Plug>(YankyPutBeforeFilter)";
        options.desc = "Put Before Applying a Filter";
      }
    ];
  };
}
