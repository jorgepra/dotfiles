local status_ok, navic = pcall(require, "nvim-navic")
print("hola navic")
if not status_ok then
  return
end

local icons = require "thordog.icons"

navic.setup {
  icons = {
      File = "",
      Module = "",
    Namespace = ' ',
      Package = "",
      Class = "",
      Method = "m",
      Function = "",
      Constructor = "",
      --Method = "",
      --Function = "",
      --Constructor = "",
      Field = "",
      Property = "",
      Enum = "",
      Interface = "",
      Variable = "",
      Constant = "",
      String = "",
      Number = "",
      Boolean = "蘒",
      Array = "",
      Object = "",
      Key = "",
      Null = "Ø",
      EnumMember = "",
      Struct = "",
      Event = "",
      Operator = "",
      TypeParameter = "",
  },
  highlight = false,
  separator = " " .. icons.ui.ChevronRight .. " ",
  depth_limit = 0,
  depth_limit_indicator = "..",
}
