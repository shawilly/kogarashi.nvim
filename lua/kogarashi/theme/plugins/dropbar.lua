local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    DropBarCurrentContext = { fg = c.base.white, bold = true },
    DropBarMenuNormalFloat = { link = "NormalFloat" },
    DropBarMenuFloatBorder = { link = "FloatBorder" },
    DropBarMenuCurrentContext = { link = "Visual" },
    DropBarIconUISeparator = { fg = c.base.dimmed3 },
    DropBarIconKindFile = { link = "Directory" },
    DropBarIconKindFolder = { link = "Directory" },
    DropBarIconKindModule = { link = "@module" },
    DropBarIconKindNamespace = { link = "@module" },
    DropBarIconKindPackage = { link = "@module" },
    DropBarIconKindClass = { link = "@type" },
    DropBarIconKindMethod = { link = "@function.method" },
    DropBarIconKindFunction = { link = "@function" },
    DropBarIconKindVariable = { link = "@variable" },
    DropBarIconKindConstant = { link = "@constant" },
    DropBarIconKindString = { link = "@string" },
    DropBarIconKindNumber = { link = "@number" },
    DropBarIconKindBoolean = { link = "@boolean" },
    DropBarIconKindArray = { link = "@punctuation.bracket" },
    DropBarIconKindObject = { link = "@punctuation.bracket" },
    DropBarIconKindKey = { link = "@property" },
    DropBarIconKindNull = { link = "@constant.builtin" },
    DropBarIconKindEnum = { link = "@type" },
    DropBarIconKindEnumMember = { link = "@constant" },
    DropBarIconKindStruct = { link = "@type" },
    DropBarIconKindEvent = { link = "@keyword" },
    DropBarIconKindOperator = { link = "@operator" },
    DropBarIconKindTypeParameter = { link = "@type.definition" },
  }
end

return M
