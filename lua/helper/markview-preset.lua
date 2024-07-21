local presets = {};

presets.heading = {
  label_hls_dark = {
    {
      group_name = "label_h1",
      value = { bg = "#d20f39", fg = "#eff1f5", bold = true }
    },
    {
      group_name = "label_h2",
      value = { bg = "#fe640b", fg = "#eff1f5", bold = true }
    },
    {
      group_name = "label_h3",
      value = { bg = "#df8e1d", fg = "#eff1f5", bold = true }
    },
    {
      group_name = "label_h4",
      value = { bg = "#40a02b", fg = "#eff1f5", bold = true }
    },
    {
      group_name = "label_h5",
      value = { bg = "#179299", fg = "#eff1f5", bold = true }
    },
    {
      group_name = "label_h6",
      value = { bg = "#04a5e5", fg = "#eff1f5", bold = true }
    },
  },

  label = {
    enable = true,
    shift_width = 0,

    heading_1 = {
      style = "label",

      padding_left = "󰍟 ",
      padding_right = "     ",

      hl = "label_h1"
    },
    heading_2 = {
      style = "label",

      padding_left = "󰍟󰍟 ",
      padding_right = "     ",

      hl = "label_h2"
    },
    heading_3 = {
      style = "label",

      padding_left = "󰍟󰍟󰍟 ",
      padding_right = "     ",

      hl = "label_h3"
    },
    heading_4 = {
      style = "label",

      padding_left = "󰍟󰍟󰍟󰍟 ",
      padding_right = "     ",

      hl = "label_h4"
    },
    heading_5 = {
      style = "label",

      padding_left = "󰍟󰍟󰍟󰍟󰍟 ",
      padding_right = "     ",

      hl = "label_h5"
    },
    heading_6 = {
      style = "label",

      padding_left = "󰍟󰍟󰍟󰍟󰍟󰍟󰍟 ",
      padding_right = "     ",

      hl = "label_h6"
    },
  },
};

return presets;
