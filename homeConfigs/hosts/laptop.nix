{ lib, pkgs, ... }:

{
  programs.waybar.settings.mainBar = {
    modules-right = lib.mkBefore ["custom/fans" "custom/dgpu"];
    "custom/dgpu" = {
      exec-if  = "test \"$(supergfxctl -g)\" = \"Hybrid\" || test \"$(supergfxctl -g)\" = \"Vfio\"";
      exec  = "echo \"   on |\"";
      interval-if  = 10;
      interval = 100;
    };

    "custom/fans" = {
      exec-if  = "test \"$(cat /sys/class/hwmon/hwmon6/fan1_input)\" -gt 0 -o \"$(cat /sys/class/hwmon/hwmon6/fan2_input)\" -gt 0";
      exec  = "echo \" \" \"$(cat /sys/class/hwmon/hwmon6/fan1_input).$(cat /sys/class/hwmon/hwmon6/fan2_input) |\"";
      interval  = 1;
      interval-if  = 1;
    };
  };

  wayland.windowManager.hyprland.settings = {
	workspace = [
      "1, monitor:eDP-1"
	  "2, monitor:HDMI-A-1, default:true"
    ];
    bind = [
      ", XF86Launch1, exec, hyprlock"
      ", XF86Launch4, exec, pkill activate-linux"
	];
    monitor= [
#      "eDP-1, modeline 173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync, 0x0, 1"
	  "eDP-1, 1920x1080@120, 0x0, 1"
      "HDMI-A-1, 1920x1080@60, auto, auto"
    ];
	env = [ "AQ_DRM_DEVICES,/dev/dri/card1"];
  };

  home.packages = with pkgs; [
    blender
	wireshark
	localsend
  ];

#  programs.superfile = {
#    enable = true;
#	hotkeys = {
#	  # global
#      confirm = ["enter" ""];
#      quit = ["ctrl+c" ""];
#      
#      # movement
#      list_up = ["k" ""];
#      list_down = ["j" ""];
#      page_up = ["pgup"""];
#      page_down = ["pgdown"""];
#      
#      # file panel control
#      create_new_file_panel = ["n" ""];
#      close_file_panel = ["q" ""];
#      next_file_panel = ["tab" ""];
#      previous_file_panel = ["shift+tab" ""];
#      toggle_file_preview_panel = ["f" ""];
#      open_sort_options_menu = ["o" ""];
#      toggle_reverse_sort = ["R" ""];
#      
#      # change focus
#      focus_on_process_bar = ["ctrl+p" ""];
#      focus_on_sidebar = ["ctrl+s" ""];
#      focus_on_metadata = ["ctrl+d" ""];
#      
#      # create file/directory and rename
#      file_panel_item_create = ["a" ""];
#      file_panel_item_rename = ["r" ""];
#      
#      # file operations
#      copy_items = ["y" ""];
#      cut_items = ["x" ""];
#      paste_items = ["p" ""];
#      delete_items = ["d" ""];
#      
#      # compress and extract
#      extract_file = ["ctrl+e" ""];
#      compress_file = ["ctrl+a" ""];
#      
#      # editor
#      open_file_with_editor = ["e" ""];
#      open_current_directory_with_editor = ["E" ""];
#      
#      # other
#      pinned_directory = ["P" ""];
#      toggle_dot_file = ["." ""];
#      change_panel_mode = ["m" ""];
#      open_help_menu = ["?" ""];
#      open_command_line = [":" ""];
#      copy_path = ["Y" ""];
#      copy_present_working_directory = ["c" ""];
#      toggle_footer = ["ctrl+f" ""];
#      
#      # Typing hotkeys (can conflict with all hotkeys)
#      confirm_typing = ["enter" ""];
#      cancel_typing = ["esc" ""];
#      
#      # =================================================================================================
#      # Normal mode hotkeys (can conflict with other modes cannot conflict with global hotkeys)
#      parent_directory = ["-" ""];
#      search_bar = ["/" ""];
#      
#      # =================================================================================================
#      # Select mode hotkeys (can conflict with other modes cannot conflict with global hotkeys)
#      file_panel_select_mode_items_select_down = ["J" ""];
#      file_panel_select_mode_items_select_up = ["K" ""];
#      file_panel_select_all_items = ["A" ""];
#
#	};
#  };

}
