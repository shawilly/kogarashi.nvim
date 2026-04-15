local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    TroubleNormal = { link = "Normal" },
    TroubleNormalNC = { link = "NormalNC" },
    TroubleText = { fg = c.base.dimmed1 },
    TroubleCount = { bg = c.base.orange, fg = c.base.black, bold = true },
    TroubleFile = { fg = c.base.white },
    TroubleSource = { fg = c.base.dimmed2 },
    TroubleCode = { fg = c.base.magenta },
    TroubleIndent = { fg = c.base.dimmed4 },
    TroubleFoldIcon = { fg = c.base.dimmed2 },
    TroubleIconArray = { link = "@punctuation.bracket" },
    TroubleIconBoolean = { link = "@boolean" },
    TroubleIconClass = { link = "@type" },
    TroubleIconConstant = { link = "@constant" },
    TroubleIconConstructor = { link = "@constructor" },
    TroubleIconEnum = { link = "@type" },
    TroubleIconEnumMember = { link = "@constant" },
    TroubleIconEvent = { link = "@keyword" },
    TroubleIconField = { link = "@property" },
    TroubleIconFile = { link = "Directory" },
    TroubleIconFunction = { link = "@function" },
    TroubleIconInterface = { link = "@type" },
    TroubleIconKey = { link = "@property" },
    TroubleIconMethod = { link = "@function.method" },
    TroubleIconModule = { link = "@module" },
    TroubleIconNamespace = { link = "@module" },
    TroubleIconNull = { link = "@constant.builtin" },
    TroubleIconNumber = { link = "@number" },
    TroubleIconObject = { link = "@punctuation.bracket" },
    TroubleIconOperator = { link = "@operator" },
    TroubleIconPackage = { link = "@module" },
    TroubleIconProperty = { link = "@property" },
    TroubleIconString = { link = "@string" },
    TroubleIconStruct = { link = "@type" },
    TroubleIconVariable = { link = "@variable" },
  }
end

return M
