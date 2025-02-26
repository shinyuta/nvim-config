return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    enabled = true,
    init = false,
    opts = function()
      local dashboard = require("alpha.themes.dashboard")
      local logo = [[
                                           W
                                        HYDID
                                     YOULEAV
                                   EMEHEKNEW
       T                        HETRUTHLIAR
     YOURET                    HEREASONIM
     STILLALIVE             SHELEFTMESH
      EISNOTMYSI          SISTERANYMO
        REITHOUGHT      MAYBEYOUCOU
          LDLOVEMELI    IKEYOUUSE
            DTOEVENTHO     UGH
               IMDIFFEREN
                 TSOHERESTO
                TH ENEWUSFINA
             LLYGOT  THENAMERIG
           HTSISTERT   WICEWHENHE
        METMEANDWHE       NIKILLEDH
      IMITSALWAYS           MEAAAAAAAA
     AAAAAAAAAAAA            AAAAAAAAAAA
   AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
   AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
      AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
]]

      dashboard.section.header.val = vim.split(logo, "\n")
      vim.api.nvim_set_hl(0, "AlphaLogo", { fg = "#FD77DD" }) -- Green logo

      -- stylua: ignore
      dashboard.section.buttons.val = {
        dashboard.button("l", "󰍂" .. " ログイン", [[<cmd> lua require("persistence").load() <cr>]]),
        dashboard.button("u", "󰿅" .. " アップデート", "<cmd> Lazy update <cr>"),
        dashboard.button("q", "󰍃" .. " ログアウト", "<cmd> qa <cr>")
      }

      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "Comment"
        button.opts.hl_shortcut = ""
        button.opts.position = "center"
        button.opts.width = 25
      end
      dashboard.section.header.opts.hl = "AlphaLogo"
      dashboard.section.footer.opts.hl = "Keyword"
      dashboard.opts.layout[1].val = 8
      return dashboard
    end,

    config = function(_, dashboard)
      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          once = true,
          pattern = "AlphaReady",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      require("alpha").setup(dashboard.opts)

      vim.api.nvim_create_autocmd("User", {
        once = true,
        pattern = "LazyVimStarted",
        callback = function()
        end,
      })
    end,
  },
}
