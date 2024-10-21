{...}: {

wayland.windowManager.hyprland = {
  enable = true;
  settings = {

    # Generic programs
    "$app-launcher" = "fuzzel";
    "$terminal-emulator" = "kitty";
    "$web-browser" = "firefox";
    
    general = {
      "border_size" = 0;
      "gaps_in" = 0;
      "gaps_out" = 0;
      "layout" = "dwindle";
      "no_focus_fallback" = "true";
      "resize_on_border" = "false";
      "allow_tearing" = "false"; # TEST GAMES WITH BOTH STATES
    };

    decoration = {
      "rounding" = 0;
      "active_opacity" = 1.0;
      "inactive_opacity" = 0.9;
      "fullscreen_opacity" = 1.0;
      "drop_shadow" = "false";
      "dim_inactive" = "true";
      "dim_strength" = 0.3;
      "dim_special" = 0.3;
      "dim_around" = 0.3;
      blur = {
        "enabled" = "false";
      };
    };

    animations = {
      "enabled" = "true";
      "first_launch_animation" = "true"; 
    };

    bezier = [
      "custom, 0, 0.7, 0.7, 1"
    ];

    animation = [
      "global, 1, 3, custom"
    ];
    
    input = {
      "kb_layout" = "latam";
      "repeat_rate" = 60;
      "repeat_delay" = 180;
      "force_no_accel" = "true";
      "follow_mouse" = 1; # Focus follows mouse
      "focus_on_close" = 0;
      "mouse_refocus" = "false";
      "float_switch_override_focus" = "0";
      "emulate_discrete_scroll" = "0";
    };

    misc = {
      "disable_hyprland_logo" = "false";
      "disable_splash_rendering" = "true";
      "font_family" = "TeXGyreAdventor";
      "force_default_wallpaper" = 2;
      "vfr" = "true"; # Variable Frame Rate
      "vrr" = 0; # Adaptive Sync
      "layers_hog_keyboard_focus" = "true";
      "enable_swallow" = "false";
      "focus_on_activate" = "true";
      "new_window_takes_over_fullscreen" = 1;
      "exit_window_retains_fullscreen" = "false";
      "initial_workspace_tracking" = 0;
      "middle_click_paste" = "false";
      "render_unfocused_fps" = 1;
    };

    binds = {
      "workspace_center_on" = 1;
      "focus_preferred_method" = 1;
      "movefocus_cycles_fullscreen" = "false";
      "disable_keybind_grabbing" = "false";
      "window_direction_monitor_fallback" = "false";
    };

    xwayland = {
      "enabled" = "true"; # Needed for steam, etc
      "use_nearest_neighbor" = "true";
      "force_zero_scaling" = "true";
    };

    opengl = {
      "nvidia_anti_flicker" = "false";
      "force_introspection" = 2;
    };

    render = {
      "explicit_sync" = 2;
      "explicit_sync_kms" = 2;
      "direct_scanout" = "true"; # TEST GAMES WITH BOTH STATES
    };

    cursor = {
      "sync_gsettings_theme" = "true";
      "no_hardware_cursors" = "true";
      "no_break_fs_vrr" = "true";
      "min_refresh_rate" = "60";
      "hotspot_padding" = 0;
      "inactive_timeout" = 0.1;
      "no_warps" = "false";
      "persistent_warps" = "false";
      "warp_on_change_workspace" = "true";
      "enable_hyprcursor" = "true";
      "hide_on_key_press" = "true";
    };

    # Keywords
    env = [
    "XCURSOR_SIZE,24"
    "HYPRCURSOR_SIZE,12"
    ];

    # Monitors
    "monitor" = ",1920x1080@60.00,auto,1";

    # Bind modes
    "$workspace" = "SHIFT";
    "$workspace-move" = "$workspace+CTRL";
    "$window" = "ALT";
    "$window-move" = "$window+CTRL";
    "$window-resize" = "$window+SHIFT";
    
    # Spam keybinds
    binde = [
      "$window, Tab, cyclenext"
      "$window, Left, movefocus, l"
      "$window, Right, movefocus, r"
      "$window, Up, movefocus, u"
      "$window, Down, movefocus, d"
      
      "$window-move, Left, moveactive, -15 0"
      "$window-move, Right, moveactive, 15 0"
      "$window-move, Up, moveactive, 0 -15"
      "$window-move, Down, moveactive, 0 15"
      
      "$window-resize, Left, resizeactive, -10 0"
      "$window-resize, Right, resizeactive, 10 0"
      "$window-resize, Up, resizeactive, 0 -10"
      "$window-resize, Down, resizeactive, 0 10"
    ];

    # One-shot keybinds
    bind = [
      ", Super_L, exec, pkill $app-launcher || $app-launcher"
      ", Super_R, exec, pkill $app-launcher || $app-launcher"
      
      "$workspace, Right, workspace, e+1"
      "$workspace, Left, workspace, e-1"
      "$workspace-move, Left, movetoworkspace, -1"
      "$workspace-move, Right, movetoworkspace, +1"
      "$workspace-move, Delete, exit"
      
      "$window, w, exec, $web-browser"
      "$window, e, exec, $terminal-emulator"
      "$window, q, killactive"
      "$window, f, fullscreen, 0"
      "$window, 1, togglefloating"
      "$window, 2, centerwindow"
      "$window, 3, pin"
      
      "$window-move, Left, swapwindow, l"
      "$window-move, Right, swapwindow, r"
      "$window-move, Up, swapwindow, u"
      "$window-move, Down, swapwindow, d"
      
      ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 0.6 @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume -l 0.6 @DEFAULT_AUDIO_SINK@ 5%-"
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      # ", XF86AudioNext, exec, playerctl next"
      # ", XF86AudioPause, exec, playerctl play-pause"
      # ", XF86AudioPlay, exec, playerctl play-pause"
      # ", XF86AudioPrev, exec, playerctl previous"
    ];

    dwindle = {
      "force_split" = 2;
      "preserve_split" = "true";
      "smart_split" = "false";
      "split_width_multiplier" = 1.0;
      "use_active_for_splits" = true;
      "default_split_ratio" = 1.0;
      "split_bias" = 0;
    };

};};}
