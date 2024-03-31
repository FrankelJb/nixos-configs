{pkgs, ...}: let
  brightnessctl = "${pkgs.brightnessctl}/bin/brightnessctl";
  pactl = "${pkgs.pulseaudio}/bin/pactl";
in {
  wayland.windowManager.hyprland = {
    settings = {
      # assign apps
      "$mainMod" = "SUPER";
      "$term" = "foot";
      "$editor" = "codium";
      "$file" = "dolphin";
      "$browser" = "firefox";

      monitor = [
        ",preferred,auto,auto"
        "DP-3,2560x1440@240,0x0,1"
      ];

      env = [
        # TODO: merge these with variables.nix
        # Some default env vars.
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "GDK_BACKEND,wayland"
        "QT_QPA_PLATFORM,wayland"
        "QT_QPA_PLATFORMTHEME,qt5ct"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "GBM_BACKEND,nvidia-drm"
        "LIBVA_DRIVER_NAME,nvidia"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "__GL_VRR_ALLOWED,1"
        "WLR_NO_HARDWARE_CURSORS,1"
        "WLR_DRM_NO_ATOMIC,1"
        "WLR_DRM_DEVICES,/dev/dri/card1"
      ];

      # autostart
      exec-once = [
        "systemctl --user import-environment &"
        "hash dbus-update-activation-environment 2>/dev/null &"
        "dbus-update-activation-environment --systemd &"
        "nm-applet &"
        "wl-paste --type text --watch cliphist store" # clipboard store text data
        "wl-paste --type image --watch cliphist store" # clipboard store image data
        "swaybg -m fill -i $(find ~/Pictures/wallpapers/ -maxdepth 1 -type f) &"
        "hyprctl setcursor Nordzy-cursors 22 &"
        "ags -b hypr"
      ];

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = 0;
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
        vrr = 0;
        enable_swallow = true;
        no_direct_scanout = true; #for fullscreen games
        focus_on_activate = true;
      };

      general = {
        layout = "dwindle";

        gaps_in = 5;
        gaps_out = 5;
        border_size = 2;
        "col.active_border" = "rgb(cba6f7) rgb(94e2d5) 45deg";
        "col.inactive_border" = "0x00000000";
        border_part_of_window = true;
      };

      dwindle = {
        no_gaps_when_only = true;
        force_split = 0;
        special_scale_factor = 1.0;
        split_width_multiplier = 1.0;
        use_active_for_splits = true;
        pseudotile = "yes";
        preserve_split = "yes";
      };

      master = {
        new_is_master = true;
        special_scale_factor = 1;
        no_gaps_when_only = false;
      };

      decoration = {
        rounding = 5;

        active_opacity = 0.90;
        inactive_opacity = 0.90;
        fullscreen_opacity = 1.0;

        blur = {
          enabled = true;

          size = 4;
          passes = 2;

          brightness = 1;
          contrast = 1.300000;
          ignore_opacity = true;
          noise = 0.011700;

          new_optimizations = true;

          xray = true;
        };

        drop_shadow = true;

        shadow_ignore_window = true;
        shadow_offset = "0 2";
        shadow_range = 20;
        shadow_render_power = 3;
        "col.shadow" = "rgba(00000055)";
      };

      animations = {
        enabled = true;

        bezier = [
          "fluent_decel, 0, 0.2, 0.4, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutCubic, 0.33, 1, 0.68, 1"
          "easeinoutsine, 0.37, 0, 0.63, 1"
        ];

        animation = [
          # Windows
          "windowsIn, 1, 3, easeOutCubic, popin 30%" # window open
          "windowsOut, 1, 3, fluent_decel, popin 70%" # window close.
          "windowsMove, 1, 2, easeinoutsine, slide" # everything in between, moving, dragging, resizing.

          # Fade
          "fadeIn, 1, 3, easeOutCubic" # fade in (open) -> layers and windows
          "fadeOut, 1, 2, easeOutCubic" # fade out (close) -> layers and windows
          "fadeSwitch, 0, 1, easeOutCirc" # fade on changing activewindow and its opacity
          "fadeShadow, 1, 10, easeOutCirc" # fade on changing activewindow for shadows
          "fadeDim, 1, 4, fluent_decel" # the easing of the dimming of inactive windows
          "border, 1, 2.7, easeOutCirc" # for animating the border's color switch speed
          "borderangle, 1, 30, fluent_decel, once" # for animating the border's gradient angle - styles: once (default), loop
          "workspaces, 1, 4, easeOutCubic, fade" # styles: slide, slidevert, fade, slidefade, slidefadevert
        ];
      };

      bind = let
        binding = mod: cmd: key: arg: "${mod}, ${key}, ${cmd}, ${arg}";
        mvfocus = binding "SUPER" "movefocus";
        ws = binding "SUPER" "workspace";
        resizeactive = binding "SUPER CTRL" "resizeactive";
        mvactive = binding "SUPER ALT" "moveactive";
        mvtows = binding "SUPER SHIFT" "movetoworkspace";
        e = "exec, ags -b hypr";
        arr = [1 2 3 4 5 6 7 8 9];
      in [
        "$mainMod, Q, killactive"
        "$mainMod ALT CTRL SHIFT, delete, exit," # kill hyperland session
        "$mainMod CTRL SHIFT, R,  ${e} quit; ags -b hypr"
        "$mainMod, W, togglefloating," # toggle the window on focus to float
        "$mainMod, G, togglegroup," # toggle the window on focus to float
        "$mainMod, F, fullscreen," # toggle the window on focus to fullscreen
        "$mainMod, ESCAPE, ${e} -t powermenu" # logout menu

        # Application shortcuts
        "$mainMod, RETURN, exec, $term" # open terminal
        "$mainMod, E, exec, $file" # open file manager
        "$mainMod, C, exec, $editor" # open vscode
        "$mainMod, B, exec, $browser" # open browser
        "$mainMod, V, exec, anyrun" # open anyrun for clipboard
        "$CONTROL SHIFT, ESCAPE, exec, ~/.config/hypr/scripts/sysmonlaunch.sh" # open htop/btop if installed or default to top (system monitor)
        "$mainMod_SHIFT, F, fullscreen," # toggle the window on focus to fullscreen
        "$mainMod, G, exec, $scriptsDir/gamemode.sh" # disable hypr effects for gamemode
        "$mainMod ALT CTRL, P, exec, $scriptsDir/logoutlaunch.sh 1" # logout menu
        "$mainMod, N, exec, swaync-client -t -sw"

        # layout
        "$mainMod_SHIFT, P, pseudo," # dwindle
        "$mainMod_SHIFT, space, exec, $changeLayout"
        "$mainMod_SHIFT, H, layoutmsg, orientationtop"
        "$mainMod_SHIFT, V, layoutmsg, orientationnext"
        "$mainMod CTRL, Return, layoutmsg, swapwithmaster"

        "$mainMod, space, ${e} -t launcher" # launch desktop applications
        "$mainMod, tab, ${e} -t overview"
        "$mainMod SHIFT, tab, workspace, m-1"

        # Screenshot/Screencapture
        "$mainMod, P, ${e} -r 'recorder.screenshot()'" # drag to snip an area / click on a window to print it
        "$mainMod ALT, P, ${e} -r 'recorder.screenshot(true)'" # print focused monitor
        ",print, exec, $scriptsDir/screenshot.sh p" # print all monitor outputs

        # Move (vim style)
        "$mainMod CTRL, H, movewindow, l"
        "$mainMod CTRL, L, movewindow, r"
        "$mainMod CTRL, K, movewindow, u"
        "$mainMod CTRL, J, movewindow, d"

        # Move focus with mainMod + arrow keys
        "$mainMod, h, movefocus, l"
        "$mainMod, j, movefocus, d"
        "$mainMod, k, movefocus, u"
        "$mainMod, l, movefocus, r"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Switch workspaces relative to the active workspace with mainMod + CTRL + [←→]
        "$mainMod CTRL, right, workspace, r+1"
        "$mainMod CTRL, left, workspace, r-1"

        # move to the first empty workspace instantly with mainMod + CTRL + [↓]
        "$mainMod CTRL, down, workspace, empty"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Move active window to a relative workspace with mainMod + CTRL + ALT + [←→]
        "$mainMod CTRL ALT, right, movetoworkspace, r+1"
        "$mainMod CTRL ALT, left, movetoworkspace, r-1"

        # Move active window around current workspace with mainMod + SHIFT + CTRL [←→↑↓]
        "$mainMod SHIFT $CONTROL, left, movewindow, l"
        "$mainMod SHIFT $CONTROL, right, movewindow, r"
        "$mainMod SHIFT $CONTROL, up, movewindow, u"
        "$mainMod SHIFT $CONTROL, down, movewindow, d"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        # Special workspaces (scratchpad)
        "$mainMod ALT, S, movetoworkspacesilent, special"
        "$mainMod, S, togglespecialworkspace,"

        # Toggle Layout
        "$mainMod Shift, J, togglesplit, # dwindle"

        # Move window silently to workspace Super + Alt + [0-9]
        "$mainMod ALT, 1, movetoworkspacesilent, 1"
        "$mainMod ALT, 2, movetoworkspacesilent, 2"
        "$mainMod ALT, 3, movetoworkspacesilent, 3"
        "$mainMod ALT, 4, movetoworkspacesilent, 4"
        "$mainMod ALT, 5, movetoworkspacesilent, 5"
        "$mainMod ALT, 6, movetoworkspacesilent, 6"
        "$mainMod ALT, 7, movetoworkspacesilent, 7"
        "$mainMod ALT, 8, movetoworkspacesilent, 8"
        "$mainMod ALT, 9, movetoworkspacesilent, 9"
        "$mainMod ALT, 0, movetoworkspacesilent, 10"
      ];

      binde = [
        # Resize windows
        "$mainMod SHIFT, right, resizeactive, 30 0"
        "$mainMod SHIFT, left, resizeactive, -30 0"
        "$mainMod SHIFT, up, resizeactive, 0 -30"
        "$mainMod SHIFT, down, resizeactive, 0 30"
      ];

      bindl = [
        ",XF86AudioMute, exec, sound-toggle"
      ];

      bindle = [
        ",XF86AudioRaiseVolume,  exec, ${pactl} set-sink-volume @DEFAULT_SINK@ +5%"
        ",XF86AudioLowerVolume,  exec, ${pactl} set-sink-volume @DEFAULT_SINK@ -5%"
        ",XF86MonBrightnessUp,   exec, ${brightnessctl} set +5%"
        ",XF86MonBrightnessDown, exec, ${brightnessctl} set  5%-"
      ];

      bindm = [
        # Move/Resize windows with mainMod + LMB/RMB and dragging
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
