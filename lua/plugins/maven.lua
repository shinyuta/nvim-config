return {
   "oclay1st/maven.nvim",
   cmd = { "Maven", "MavenInit", "MavenExec" },
   dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
   },
   opts = {}, -- options, see default configuration
   keys = {
      {
        "<Leader>M",
        function()
          require("maven").toggle_projects_view()
        end,
        desc = "Maven",
      },
   }
}
