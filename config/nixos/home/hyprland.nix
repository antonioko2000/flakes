{...}: {

wayland.windowManager.hyprland = {
  enable = true;
  settings = {

    # Programs to execute
    "$terminal-emulator" = "kitty";
    "$web-browser" = "firefox";
    "$bluetooth-app" = "blueman";
    "$volume-app" = "pavucontrol";
    
    general = {
      "border_size" = 0;
      "no_border_on_floating" = "false";
      "gaps_in" = 10;
      "gaps_out" = 10;
      "col.inactive_border" = "0xff444444";
      "col.active_border" = "0xffaaaaaa";
      "layout" = "dwindle"; # dwindle or master
      "no_focus_fallback" = "true";
      "resize_on_border" = "true";
      "extend_border_grab_area" = 15;
      "allow_tearing" = "false";
    };

    decoration = {
      "rounding" = 5;
      "active_opacity" = 1.0;
      "inactive_opacity" = 0.85;
      "drop_shadow" = "true";
      "shadow_range" = 4;
      "shadow_render_power" = 3;
      "shadow_ignore_window" = "true";
      "col.shadow" = "0xee1a1a1a";
      "dim_inactive" = "false";
      "dim_strength" = 0.5;
      blur = {
        "enabled" = "true";
        "size" = 8;
        "passes" = 1;
        "ignore_opacity" = "false";
        "new_optimizations" = "true";
        "xray" = "true";
      };
    };

    animations = {
      "enabled" = "true";
      "first_launch_animation" = "true";
      # Set advanced animations on later generations
    };
    
    input = {
      "kb_layout" = "latam";
      "numlock_by_default" = "false";
      "repeat_rate" = 60;
      "repeat_delay" = 250;
      "sensitivity" = 0.0; # Mouse sensitivity/acceleration. Range: -1.0 to 1.0
      "accel_profile" = "adaptive"; # Adaptive, flat, custom or empty
      "force_no_accel" = "false";
      "follow_mouse" = 1; # Mouse focus options. 0=disabled, 1=always on, 2=on click
      "focus_on_close" = 0; # 0=next window, 1=window under cursor
      "mouse_refocus" = "true";
      "float_switch_override_focus" = "1";
    };

    misc = {
      "disable_hyprland_logo" = "false";
      "font_family" = "";
      "vrr" = 0; # Adaptive Sync
      "animate_manual_resizes" = "true";
      "animate_mouse_windowdragging" = "true";
      "enable_swallow" = "false";
      "render_ahead_of_time" = "false";
      "render_ahead_safezone" = 1;
      "new_window_takes_over_fullscreen" = 0;
      "exit_window_retains_fullscreen" = "false";
      "middle_click_paste" = "false";
    };

    binds = {
      "pass_mouse_when_bound" = "false";
      "scroll_event_delay" = "300";
      "workspace_center_on" = 1;
      "focus_preferred_method" = 0;
      "movefocus_cycles_fullscreen" = "true";
      "disable_keybind_grabbing" = "false";
    };

    xwayland = {
      "enabled" = "true";
      "use_nearest_neighbor" = "true";
      "force_zero_scaling" = "true";
    };

    opengl = {
      "nvidia_anti_flicker" = "true";
      "force_intospection" = 2;
    };

    render = {
      "explicit_sync" = 2;
      "direct_scanout" = "false";
    };

    cursor = {
      "sync_gsettings_theme" = "true";
      "no_hardware_cursors" = "false";
      "no_break_fs_vrr" = "false";
      "hotspot_padding" = 1;
      "inactive_timeout" = 0;
      "zoom_factor" = 1.0;
      "hide_on_key_press" = "false";
      "allow_dumb_copy" = "false";
    };

    # Keywords
    "exec-once" = "$terminal & $web-browser";
    env = [
    "XCURSOR_SIZE,24"
    "HYPRCURSOR_SIZE,24"
    ];

    # Monitors
    "monitor" = ",1920x1080@60.00,auto,auto";  

    # Keybinds
    bind = [
      
      # Execution
      "SUPER, E, exec, $terminal-emulator"
      "SUPER, W, exec, $web-browser"
      "SUPER, B, exec, $bluetooth-app"
      "SUPER, V, exec, $volume-app"
      "SUPER, S, exec, steam"
      "SUPER, D, exec, discord"

      # Windows
      "CTRL+SHIFT, Q, killactive"
      "CTRL+SHIFT, S, togglefloating"
      "CTRL+SHIFT, F, fullscreen, 1"
      "CTRL+SHIFT, P, pin"
      "CTRL+SHIFT, C, centerwindow"
      "CTRL+SHIFT, Left, swapwindow, l"
      "CTRL+SHIFT, Up, swapwindow, u"
      "CTRL+SHIFT, Right, swapwindow, r"
      "CTRL+SHIFT, Down, swapwindow, d"

      # Workspaces
      "CAPS, 1, movetoworspacesilent, 1"
      "CAPS, 2, movetoworspacesilent, 2"
      "CAPS, 3, movetoworspacesilent, 3"
      "CAPS+SHIFT, 1, workspace, 1"
      "CAPS+SHIFT, 2, workspace, 2"
      "CAPS+SHIFT, 3, workspace, 3"
      "CAPS+SHIFT, Escape, exit"
      
      # Focus
      "SHIFT+ALT, Left, movefocus, l"
      "SHIFT+ALT, Up, movefocus, u"
      "SHIFT+ALT, Right, movefocus, r"
      "SHIFT+ALT, Down, movefocus, d"
      "SHIFT+ALT, Q, cyclenext, prev"
      "SHIFT+ALT, E, cyclenext"

      # Special keys
      ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%-"
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      # ", XF86AudioNext, exec, playerctl next"
      # ", XF86AudioPause, exec, playerctl play-pause"
      # ", XF86AudioPlay, exec, playerctl play-pause"
      # ", XF86AudioPrev, exec, playerctl previous"
    ];

};};}
