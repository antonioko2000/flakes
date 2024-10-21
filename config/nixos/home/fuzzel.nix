{...}: {

programs.fuzzel = {
  enable = true;
  settings = {
    
    main = {
      use-bold = true;
      icon-theme = "hicolor";
      icons-enabled = true;
      hide-before-typing = false;
      match-mode = "exact";
      sort-result = false;
      match-counter = false;
      filter-desktop = true;
      show-actions = false;
      list-executables-in-path = false;
      anchor = "center";
      lines = 10;
      width = 30;
      tabs = 8;
      horizontal-pad = 48;
      vertical-pad = 24;
      inner-pad = 16;
      image-size-ratio = 0.5;
      layer = "overlay";
      exit-on-keyboard-focus-loss = true;
    };

    colors = {
      background = "28282877";
      text = "E6E6E6FF";
      prompt = "00000000";
      placeholder = "00000000";
      input = "FFFFFFFF";
      match = "FFFFFFFF";
      selection = "00000000";
      selection-text = "FFFFFFFF";
      selection-match = "FFFFFFFF";
      counter = "FFFFFFFF";
      border = "FFFFFFFF";
    };

    border.width = 0;

};};}

