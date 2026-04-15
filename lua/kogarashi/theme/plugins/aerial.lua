local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    AerialLine = { bg = c.editor.selectionHighlightBackground },
    AerialArray = { fg = c.base.yellow },
    AerialBoolean = { fg = c.base.yellow },
    AerialClass = { fg = c.base.cyan },
    AerialConstant = { fg = c.base.orange },
    AerialConstructor = { fg = c.base.green },
    AerialEnum = { fg = c.base.cyan },
    AerialEnumMember = { fg = c.base.magenta },
    AerialEvent = { fg = c.base.yellow },
    AerialField = { fg = c.base.green },
    AerialFile = { fg = c.base.green },
    AerialFunction = { fg = c.base.green },
    AerialInterface = { fg = c.base.cyan },
    AerialKey = { fg = c.base.red },
    AerialMethod = { fg = c.base.green },
    AerialModule = { fg = c.base.cyan },
    AerialNamespace = { fg = c.base.red },
    AerialNull = { fg = c.base.yellow },
    AerialNumber = { fg = c.base.yellow },
    AerialObject = { fg = c.base.yellow },
    AerialOperator = { fg = c.base.red },
    AerialPackage = { fg = c.base.red },
    AerialProperty = { fg = c.base.orange },
    AerialString = { fg = c.base.yellow },
    AerialStruct = { fg = c.base.cyan },
    AerialTypeParameter = { fg = c.base.cyan },
    AerialVariable = { fg = c.base.orange },
  }
end

return M
