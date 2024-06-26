{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;

    theme = "Dracula";

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 9;
    };

    settings = {
      confirm_os_window_close = 0;
      background_opacity = "0.95";
      scrollback_lines = 10000;
      enable_audio_bell = false;
      notify_on_cmd_finish = "invisible 10.0 command notify-send job finished";
      mouse_hide_wait = 60;

      ## Tabs
      tab_title_template = "{index}";
      active_tab_font_style = "normal";
      inactive_tab_font_style = "normal";
      tab_bar_style = "powerline";
      tab_powerline_style = "round";
      active_tab_foreground = "#1e1e2e";
      active_tab_background = "#cba6f7";
      inactive_tab_foreground = "#bac2de";
      inactive_tab_background = "#313244";
    };
  };
}
