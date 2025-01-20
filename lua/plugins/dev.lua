return {
  -- dir = "/home/tieu/code/personal/grpcui.nvim",
  "letieu/grpcui.nvim",
  keys = {
    {
      "<leader>pp",
      function()
        require("grpcui").open('om-com')
      end,
      desc = "graphql - Open",
    },
  },
}
