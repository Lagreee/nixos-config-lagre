{ pkgs, ... }: {
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    
    settings = {
      manager = {
        show_hidden = true;
        show_symlink = true;
        sort_by = "alphabetical";
        sort_dir_first = true;
        sort_reverse = false;
      };
      
      preview = {
        tab_size = 2;
        max_width = 600;
        max_height = 900;
      };
      
      opener = {
        edit = [
          { run = "nvim \"$@\""; block = true; }
        ];
        open = [
          { run = "xdg-open \"$@\""; desc = "Open"; }
        ];
      };
    };
    
    keymap = {
      manager.prepend_keymap = [
        { on = "T"; run = "plugin --sync max-preview"; desc = "Maximize or restore preview"; }
        { on = "<C-s>"; run = "search fd"; desc = "Search files by name using fd"; }
      ];
    };
    
    theme = {
      manager = {
        cwd = { fg = "#83a598"; };
        hovered = { bg = "#3c3836"; };
        preview_hovered = { bg = "#3c3836"; };
        find_keyword = { fg = "#fabd2f"; bold = true; };
        find_position = { fg = "#fe8019"; bg = "reset"; bold = true; };
      };
      
      status = {
        separator_open = "";
        separator_close = "";
        mode_normal = { fg = "#1d2021"; bg = "#a89984"; bold = true; };
        mode_select = { fg = "#1d2021"; bg = "#d79921"; bold = true; };
        mode_unset = { fg = "#1d2021"; bg = "#fb4934"; bold = true; };
      };
      
      input = {
        border = { fg = "#665c54"; };
        title = { fg = "#ebdbb2"; };
        value = { fg = "#ebdbb2"; };
        selected = { bg = "#504945"; };
      };
      
      select = {
        border = { fg = "#665c54"; };
        active = { fg = "#fe8019"; };
        inactive = { fg = "#a89984"; };
      };
      
      tasks = {
        border = { fg = "#665c54"; };
        title = { fg = "#ebdbb2"; };
        hovered = { bg = "#3c3836"; };
      };
    };
  };

 stylix.targets.yazi.enable = false;
}
