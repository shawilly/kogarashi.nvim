local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    TodoBgFIX = { bg = c.inputValidation.errorForeground, fg = c.base.black, bold = true },
    TodoBgHACK = { bg = c.base.orange, fg = c.base.black, bold = true },
    TodoBgNOTE = { bg = c.inputValidation.infoForeground, fg = c.base.black, bold = true },
    TodoBgPERF = { bg = c.base.magenta, fg = c.base.black, bold = true },
    TodoBgTEST = { bg = c.base.yellow, fg = c.base.black, bold = true },
    TodoBgTODO = { bg = c.base.green, fg = c.base.black, bold = true },
    TodoFgFIX = { fg = c.inputValidation.errorForeground, bold = true },
    TodoFgHACK = { fg = c.base.orange, bold = true },
    TodoFgNOTE = { fg = c.inputValidation.infoForeground, bold = true },
    TodoFgPERF = { fg = c.base.magenta, bold = true },
    TodoFgTEST = { fg = c.base.yellow, bold = true },
    TodoFgTODO = { fg = c.base.green, bold = true },
    TodoSignFIX = { link = "TodoFgFIX" },
    TodoSignHACK = { link = "TodoFgHACK" },
    TodoSignNOTE = { link = "TodoFgNOTE" },
    TodoSignPERF = { link = "TodoFgPERF" },
    TodoSignTEST = { link = "TodoFgTEST" },
    TodoSignTODO = { link = "TodoFgTODO" },
  }
end

return M
