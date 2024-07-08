local presets = {};

presets.heading = {
  label_hls_dark = {
    {
      group_name = "label_h1",
      value = { bg = "#453244", fg = "#f38ba8", bold = true }
    },
    {
      group_name = "label_h2",
      value = { bg = "#46393e", fg = "#fab387", bold = true }
    },
    {
      group_name = "label_h3",
      value = { bg = "#464245", fg = "#f9e2af", bold = true }
    },
    {
      group_name = "label_h4",
      value = { bg = "#374243", fg = "#a6e3a1", bold = true }
    },
    {
      group_name = "label_h5",
      value = { bg = "#2e3d51", fg = "#74c7ec", bold = true }
    },
    {
      group_name = "label_h6",
      value = { bg = "#393b54", fg = "#b4befe", bold = true }
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

      padding_left = "󰍟 ",
      padding_right = "     ",

      hl = "label_h2"
    },
    heading_3 = {
      style = "label",

      padding_left = "󰍟 ",
      padding_right = "     ",

      hl = "label_h3"
    },
    heading_4 = {
      style = "label",

      padding_left = "󰍟 ",
      padding_right = "     ",

      hl = "label_h4"
    },
    heading_5 = {
      style = "label",

      padding_left = "󰍟 ",
      padding_right = "     ",

      hl = "label_h5"
    },
    heading_6 = {
      style = "label",

      padding_left = "󰍟 ",
      padding_right = "     ",

      hl = "label_h6"
    },
  },
};

return presets;
