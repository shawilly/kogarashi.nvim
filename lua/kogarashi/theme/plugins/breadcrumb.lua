local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    WinBar = {
      bg = c.editor.background,
      fg = c.breadcrumb.foreground,
    },
    BreadcrumbIconsArray = { fg = c.base.yellow },
    BreadcrumbIconsBoolean = { fg = c.base.yellow },
    BreadcrumbIconsClass = { fg = c.base.cyan },
    BreadcrumbIconsColor = { fg = c.base.yellow },
    BreadcrumbIconsConstant = { fg = c.base.orange },
    BreadcrumbIconsConstructor = { fg = c.base.green },
    BreadcrumbIconsEnum = { fg = c.base.cyan },
    BreadcrumbIconsEnumMember = { fg = c.base.magenta },
    BreadcrumbIconsEvent = { fg = c.base.yellow },
    BreadcrumbIconsField = { fg = c.base.green },
    BreadcrumbIconsFile = { fg = c.editorLineNumber.activeForeground },
    BreadcrumbIconsFolder = { fg = c.editorLineNumber.activeForeground },
    BreadcrumbIconsFunction = { fg = c.base.green },
    BreadcrumbIconsInterface = { fg = c.base.cyan },
    BreadcrumbIconsKey = { fg = c.base.red },
    BreadcrumbIconsKeyword = { fg = c.base.red },
    BreadcrumbIconsMethod = { fg = c.base.green },
    BreadcrumbIconsModule = { fg = c.base.cyan },
    BreadcrumbIconsNamespace = { fg = c.base.red },
    BreadcrumbIconsNull = { fg = c.base.yellow },
    BreadcrumbIconsNumber = { fg = c.base.yellow },
    BreadcrumbIconsObject = { fg = c.base.yellow },
    BreadcrumbIconsOperator = { fg = c.base.red },
    BreadcrumbIconsPackage = { fg = c.base.red },
    BreadcrumbIconsProperty = { fg = c.base.orange },
    BreadcrumbIconsReference = { fg = c.base.yellow },
    BreadcrumbIconsSnippet = { fg = c.base.yellow },
    BreadcrumbIconsString = { fg = c.base.yellow },
    BreadcrumbIconsStruct = { fg = c.base.cyan },
    BreadcrumbIconsText = { fg = c.base.white },
    BreadcrumbIconsTypeParameter = { fg = c.base.cyan },
    BreadcrumbIconsUnit = { fg = c.base.magenta },
    BreadcrumbIconsVariable = { fg = c.base.orange },
  }
end

return M
