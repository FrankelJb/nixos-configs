{
  programs.nixvim = {
    plugins.neo-tree = {
      closeIfLastWindow = true;
      defaultComponentConfigs.indent = {
        expanderCollapsed = "";
        expanderExpanded = "";
        expanderHighlight = "NeoTreeExpander";
        withExpanders = true;
      };
      enable = true;
      enableDiagnostics = true;
      enableGitStatus = true;
      enableModifiedMarkers = true;
      enableRefreshOnWrite = true;
      filesystem = {
        bindToCwd = false;
        followCurrentFile.enabled = true;
      };
      popupBorderStyle = "rounded"; # Type: null or one of “NC”, “double”, “none”, “rounded”, “shadow”, “single”, “solid” or raw lua code
      sources = ["filesystem" "buffers" "git_status" "document_symbols"];
      window = {
        width = 40;
        height = 15;
        autoExpandWidth = false;
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        action = ":Neotree toggle reveal_force_cwd<cr>";
        options = {
          silent = true;
          desc = "Explorer NeoTree (root dir)";
        };
      }
      {
        mode = "n";
        key = "<leader>E";
        action = "<cmd>Neotree toggle<CR>";
        options = {
          silent = true;
          desc = "Explorer NeoTree (cwd)";
        };
      }
      {
        mode = "n";
        key = "<leader>be";
        action = ":Neotree buffers<CR>";
        options = {
          silent = true;
          desc = "Buffer explorer";
        };
      }
      {
        mode = "n";
        key = "<leader>ge";
        action = ":Neotree git_status<CR>";
        options = {
          silent = true;
          desc = "Git explorer";
        };
      }
    ];
  };
}
