local M = {}

--- @param c Colorscheme The color palette
function M.get(c)
  local inputValidation = c.inputValidation

  local notify_groups = {
    NotifyERRORBorder = { fg = inputValidation.errorBorder },
    NotifyWARNBorder = { fg = inputValidation.warningBorder },
    NotifyINFOBorder = { fg = inputValidation.infoBorder },
    NotifyDEBUGBorder = { fg = inputValidation.debugBorder },
    NotifyTRACEBorder = { fg = inputValidation.traceBorder },
    NotifyERRORIcon = { fg = inputValidation.errorForeground },
    NotifyWARNIcon = { fg = inputValidation.warningForeground },
    NotifyINFOIcon = { fg = inputValidation.infoForeground },
    NotifyDEBUGIcon = { fg = inputValidation.debugForeground },
    NotifyTRACEIcon = { fg = inputValidation.traceForeground },
    NotifyERRORTitle = { fg = inputValidation.errorForeground },
    NotifyWARNTitle = { fg = inputValidation.warningForeground },
    NotifyINFOTitle = { fg = inputValidation.infoForeground },
    NotifyDEBUGTitle = { fg = inputValidation.debugForeground },
    NotifyTRACETitle = { fg = inputValidation.traceForeground },
    NotifyERRORBody = { link = "Normal" },
    NotifyWARNBody = { link = "Normal" },
    NotifyINFOBody = { link = "Normal" },
    NotifyDEBUGBody = { link = "Normal" },
    NotifyTRACEBody = { link = "Normal" },
    NotifyBackground = { bg = "#232323" },
  }

  return notify_groups
end

return M
