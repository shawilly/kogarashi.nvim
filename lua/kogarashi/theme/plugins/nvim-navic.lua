local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    NavicIconsArray = { fg = c.base.yellow },
    NavicIconsBoolean = { fg = c.base.yellow },
    NavicIconsClass = { fg = c.base.cyan },
    NavicIconsColor = { fg = c.base.yellow },
    NavicIconsConstant = { fg = c.base.orange },
    NavicIconsConstructor = { fg = c.base.green },
    NavicIconsEnum = { fg = c.base.cyan },
    NavicIconsEnumMember = { fg = c.base.magenta },
    NavicIconsEvent = { fg = c.base.yellow },
    NavicIconsField = { fg = c.base.green },
    NavicIconsFile = { fg = c.editorLineNumber.activeForeground },
    NavicIconsFolder = { fg = c.editorLineNumber.activeForeground },
    NavicIconsFunction = { fg = c.base.green },
    NavicIconsInterface = { fg = c.base.cyan },
    NavicIconsKey = { fg = c.base.red },
    NavicIconsKeyword = { fg = c.base.red },
    NavicIconsMethod = { fg = c.base.green },
    NavicIconsModule = { fg = c.base.cyan },
    NavicIconsNamespace = { fg = c.base.red },
    NavicIconsNull = { fg = c.base.yellow },
    NavicIconsNumber = { fg = c.base.yellow },
    NavicIconsObject = { fg = c.base.yellow },
    NavicIconsOperator = { fg = c.base.red },
    NavicIconsPackage = { fg = c.base.red },
    NavicIconsProperty = { fg = c.base.orange },
    NavicIconsReference = { fg = c.base.yellow },
    NavicIconsSnippet = { fg = c.base.yellow },
    NavicIconsString = { fg = c.base.yellow },
    NavicIconsStruct = { fg = c.base.cyan },
    NavicIconsText = { fg = c.base.white },
    NavicIconsTypeParameter = { fg = c.base.cyan },
    NavicIconsUnit = { fg = c.base.magenta },
    NavicIconsVariable = { fg = c.base.orange },
  }
end

return M
