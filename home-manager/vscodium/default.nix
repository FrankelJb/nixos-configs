{ pkgs, ... }: 
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
      userSettings = {
        "editor.bracketPairColorization.enabled" = true;
        "explorer.decorations.badges" = true;
        "explorer.decorations.colors" = true;
        "editor.fontLigatures" = true;
        "editor.fontFamily" = "Fira Code";
        "editor.formatOnSave" = true;
        "editor.formatOnType" = true;
        "editor.minimap.enabled" = false;
        "editor.wordWrap" = "on";
        "editor.lineNumbers" = "relative";
        "latex-workshop.latex.tools" = [{
          "name" = "latexmk";
          "command" = "latexmk";
          "args" = [
            "-xelatex"
            "-synctex=1"
            "-interaction=nonstopmode"
            "-file-line-error"
            "%DOC%"
          ];
        }];
        "redhat.telemetry.enabled" = false;
        "rust.build_on_save" = true;
        "terminal.integrated.fontFamily" = "Fira Code";
        "vim.sneak" = true;
        "vim.sneakUseIgnorecaseAndSmartcase" = true;
        "vim.easymotion" = true;
        "vim.camelCaseMotion.enable" = true;
        "vim.normalModeKeyBindings" = [
          {
            "before" = [
              "leader"
              "w"
            ];
            "commands" = [
              "workbench.action.files.save"
            ];
          }
        ];
        "vim.leader" = "<space>";
        "workbench.colorTheme" = "Dracula";
        "workbench.iconTheme" = "material-icon-theme";
        "yaml.format.bracketSpacing" = false;
      };
      extensions = (with pkgs.vscode-extensions; [
        bungcip.better-toml
        donjayamanne.githistory
        dracula-theme.theme-dracula
        eamodio.gitlens
        editorconfig.editorconfig
        gruntfuggly.todo-tree
        james-yu.latex-workshop
        matklad.rust-analyzer
        pkief.material-icon-theme
        redhat.vscode-yaml
        skyapps.fish-vscode
        tamasfe.even-better-toml
        vscodevim.vim
      ]) ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "advanced-new-file";
          publisher = "patbenatar";
          version = "1.2.2";
          sha256 = "09a6yldbaz9d7gn9ywkqd96l3pkc0y30b6b02nv2qigli6aihm6g";
        }
        {
          name = "All-Autocomplete";
          publisher = "Atishay-Jain";
          version = "0.0.26";
          sha256 = "sha256-+hYacGYbMeH63xUOepHGAEnHDoCeIhmV8T+vTM9mkbY=";
        }
        {
          name = "vscode-assorted-languages";
          publisher = "EdwinKofler";
          version = "0.18.0";
          sha256 = "gMkifN17VZbwYMsd9pY6gp5N/zXR+lLTHrZamrr0kDo=";
        }
      ];

  };
}
