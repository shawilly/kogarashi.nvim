local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    DapBreakpoint = { fg = c.inputValidation.errorForeground },
    DapBreakpointCondition = { fg = c.inputValidation.warningForeground },
    DapBreakpointRejected = { fg = c.base.dimmed4 },
    DapLogPoint = { fg = c.inputValidation.infoForeground },
    DapStopped = { fg = c.base.green, bold = true },
  }
end

return M
