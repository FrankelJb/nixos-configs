{
  programs.nixvim = {
    plugins.bufferline = {
      enable = true;
      closeCommand = "function(n) require(\"mini.bufremove\").delete(n, false) end";
      rightMouseCommand = "function(n) require(\"mini.bufremove\").delete(n, false) end";
      diagnostics = "nvim_lsp";
      alwaysShowBufferline = true;
      diagnosticsIndicator = ''
        function(count, level, diagnostics_dict, context)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end
      '';
      offsets = [
        {
          filetype = "neo-tree";
          text = "Neo-tree";
          highlight = "Directory";
          text_align = "left";
        }
      ];
    };
    keymaps = [
      {
        key = "<leader>bp";
        action = "<Cmd>BufferLineTogglePin<CR>";
        options.desc = "Toggle Pin";
      }
      {
        key = "<leader>bP";
        action = "<Cmd>BufferLineGroupClose ungrouped<CR>";
        options. desc = "Delete Non-Pinned Buffers";
      }
      {
        key = "<leader>bo";
        action = "<Cmd>BufferLineCloseOthers<CR>";
        options. desc = "Delete Other Buffers";
      }
      {
        key = "<leader>br";
        action = "<Cmd>BufferLineCloseRight<CR>";
        options. desc = "Delete Buffers to the Right";
      }
      {
        key = "<leader>bl";
        action = "<Cmd>BufferLineCloseLeft<CR>";
        options. desc = "Delete Buffers to the Left";
      }
      {
        key = "<S-h>";
        action = "<cmd>BufferLineCyclePrev<cr>";
        options. desc = "Prev Buffer";
      }
      {
        key = "<S-l>";
        action = "<cmd>BufferLineCycleNext<cr>";
        options. desc = "Next Buffer";
      }
      {
        key = "[b";
        action = "<cmd>BufferLineCyclePrev<cr>";
        options. desc = "Prev Buffer";
      }
      {
        key = "]b";
        action = "<cmd>BufferLineCycleNext<cr>";
        options. desc = "Next Buffer";
      }
    ];
  };
}
