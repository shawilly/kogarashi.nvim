local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
function M.get(c, config, _)
  local styles = config.styles
  -- stylua: ignore
  local spec = {
    -- Annotations & Attributes
    ["@annotation"]                       = { fg = c.base.cyan, italic = styles.annotation.italic },
    ["@attribute"]                        = { fg = c.base.green }, -- `@` in decorator. E.g. `@checked`

    -- Booleans & Constants
    ["@boolean"]                          = { fg = c.base.magenta },
    ["@constant"]                         = { fg = c.base.magenta },
    ["@constant.builtin"]                 = { fg = c.base.magenta },
    ["@constant.macro"]                   = { fg = c.base.red },

    -- Constructors & Fields
    ["@constructor"]                      = { fg = c.base.green },
    ["@field"]                            = { fg = c.base.white },

    -- Diff Changes
    ["@diff.delta"]                       = { fg = c.base.yellow },
    ["@diff.minus"]                       = { fg = c.base.red },
    ["@diff.plus"]                        = { fg = c.base.green },

    -- Functions & Methods
    ["@function"]                         = { fg = c.base.green },
    ["@function.builtin"]                 = { fg = c.base.green },
    ["@function.call"]                    = { fg = c.base.green },
    ["@function.macro"]                   = { fg = c.base.green },
    ["@function.method"]                  = { fg = c.base.green },
    ["@function.method.call"]             = { fg = c.base.green },

    -- Keywords
    ["@keyword"]                          = { fg = c.base.red, italic = styles.keyword.italic },
    ["@keyword.conditional"]              = { fg = c.base.red },
    ["@keyword.coroutine"]                = { fg = c.base.red },
    ["@keyword.debug"]                    = { fg = c.base.red },
    ["@keyword.directive"]                = { fg = c.base.red },
    ["@keyword.directive.define"]         = { fg = c.base.red },
    ["@keyword.exception"]                = { fg = c.base.red },
    ["@keyword.function"]                 = { fg = c.base.red },
    ["@keyword.import"]                   = { fg = c.base.red },
    ["@keyword.operator"]                 = { fg = c.base.red },
    ["@keyword.repeat"]                   = { fg = c.base.red },
    ["@keyword.return"]                   = { fg = c.base.red },
    ["@keyword.storage"]                  = { fg = c.base.red },
    ["@keyword.type"]                     = { fg = c.base.red },

    -- Numbers & Operators
    ["@number"]                           = { fg = c.base.magenta },
    ["@number.float"]                     = { fg = c.base.magenta },
    ["@operator"]                         = { fg = c.base.red }, -- `==`, `*`, `+`, `-`

    -- Parameters & Variables
    ["@variable"]                         = { fg = c.base.white },
    ["@variable.builtin"]                 = { fg = c.base.dimmed1, italic = true },
    ["@variable.member"]                  = { fg = c.base.white },
    ["@variable.parameter"]               = { fg = c.base.orange, italic = true },
    ["@variable.parameter.builtin"]       = { fg = c.base.orange, italic = true },

    -- Punctuation
    ["@punctuation.bracket"]              = { fg = c.base.white },
    ["@punctuation.delimiter"]            = { fg = c.base.dimmed2 },
    ["@punctuation.special"]              = { fg = c.base.dimmed2 },

    -- Strings & Characters
    ["@string"]                           = { fg = c.base.yellow },
    ["@string.documentation"]             = { fg = c.base.dimmed3 },
    ["@string.escape"]                    = { fg = c.base.magenta },
    ["@string.regexp"]                    = { fg = c.base.yellow },
    ["@character"]                        = { fg = c.base.yellow },
    ["@character.printf"]                 = { fg = c.base.yellow },
    ["@character.special"]                = { fg = c.base.yellow },

    -- Tags & Markup
    ["@tag"]                              = { fg = c.base.red },
    ["@tag.attribute"]                    = { fg = c.base.orange, italic = true },
    ["@tag.builtin"]                      = { fg = c.base.red },
    ["@tag.delimiter"]                    = { fg = c.base.dimmed2 },

    -- Markup Highlight Groups
    ["@markup"]                           = { fg = c.base.white },
    ["@markup.emphasis"]                  = { fg = c.base.white, italic = true },
    ["@markup.environment"]               = { fg = c.base.white },
    ["@markup.environment.name"]          = { fg = c.base.white },
    ["@markup.heading"]                   = { fg = c.base.green, bold = true },
    ["@markup.italic"]                    = { fg = c.base.white, italic = true },
    ["@markup.link"]                      = { fg = c.base.blue, underline = true },
    ["@markup.link.label"]                = { fg = c.base.blue, underline = true },
    ["@markup.link.label.symbol"]         = { fg = c.base.blue, underline = true },
    ["@markup.link.url"]                  = { fg = c.base.blue, underline = true },
    ["@markup.list"]                      = { fg = c.base.white },
    ["@markup.list.checked"]              = { fg = c.base.white },
    ["@markup.list.markdown"]             = { fg = c.base.white },
    ["@markup.list.unchecked"]            = { fg = c.base.white },
    ["@markup.math"]                      = { fg = c.base.yellow },
    ["@markup.raw"]                       = { fg = c.base.yellow },
    ["@markup.raw.markdown_inline"]       = { fg = c.base.yellow },
    ["@markup.strikethrough"]             = { fg = c.base.white, strikethrough = true },
    ["@markup.strong"]                    = { fg = c.base.white, bold = true },
    ["@markup.underline"]                 = { fg = c.base.white, underline = true },

    -- Types
    ["@type"]                             = { fg = c.base.cyan },
    ["@type.builtin"]                     = { fg = c.base.cyan, italic = true },
    ["@type.definition"]                  = { fg = c.base.cyan },
    ["@type.qualifier"]                   = { fg = c.base.cyan },
    ["@module"]                           = { fg = c.base.cyan },
    ["@module.builtin"]                   = { fg = c.base.cyan },
    ["@namespace.builtin"]                = { fg = c.base.red },

    -- Labels
    ["@label"]                            = { fg = c.base.magenta },

    -- C++
    ["@constant.cpp"]                      = { fg = c.base.magenta },
    ["@constant.macro.cpp"]                = { fg = c.base.red },
    ["@keyword.cpp"]                       = { fg = c.base.red, italic = styles.keyword.italic },
    ["@namespace.cpp"]                     = { fg = c.base.red },
    ["@operator.cpp"]                      = { fg = c.base.red },
    ["@punctuation.delimiter.cpp"]         = { fg = c.sideBar.foreground },
    ["@type.cpp"]                          = { fg = c.base.blue, italic = styles.type.italic },
    ["@variable.cpp"]                      = { fg = c.base.white },

    -- Dockerfile
    ["@function.call.bash"]                = { fg = c.base.green },
    ["@keyword.dockerfile"]                = { fg = c.base.red },
    ["@lsp.type.class.dockerfile"]         = { fg = c.base.cyan },
    ["@parameter.bash"]                    = { fg = c.base.white },

    -- Golang
    ["@keyword.function.go"]               = { fg = c.base.red },
    ["@keyword.type.go"]                   = { fg = c.base.red, italic = true },
    ["@module.go"]                         = { fg = c.base.red },
    ["@string.escape.go"]                  = { fg = c.base.magenta },
    ["@type.go"]                           = { fg = c.base.cyan },
    ["@type.builtin.go"]                   = { fg = c.base.cyan, italic = true },
    ["@type.definition.go"]                = { fg = c.base.green },
    ["@function.go"]                       = { fg = c.base.green },
    ["@function.call.go"]                  = { fg = c.base.green },
    ["@function.method.go"]                = { fg = c.base.green },
    ["@function.method.call.go"]           = { fg = c.base.green },
    ["@variable.parameter.go"]             = { fg = c.base.orange, italic = true },
    ["@constant.go"]                       = { fg = c.base.magenta },
    ["@constant.builtin.go"]               = { fg = c.base.magenta },
    ["@field.go"]                          = { fg = c.base.white },
    ["@property.go"]                       = { fg = c.base.orange },
    ["@punctuation.bracket.go"]            = { fg = c.base.white },
    ["@punctuation.delimiter.go"]          = { fg = c.base.dimmed2 },
    ["@operator.go"]                       = { fg = c.base.red },

    -- Latex
    ["@function.macro.latex"]              = { fg = c.base.green },
    ["@punctuation.special.latex"]         = { fg = c.base.red },
    ["@string.latex"]                      = { fg = c.base.cyan },
    ["@text.emphasis.latex"]               = { italic = true },
    ["@text.environment.latex"]            = { fg = c.base.green },
    ["@text.environment.name.latex"]       = { fg = c.base.blue, italic = true },
    ["@text.math.latex"]                   = { fg = c.base.magenta },
    ["@text.strong.latex"]                 = { bold = true },

    -- Markdown
    ["@conceal.markdown"]                  = { bg = c.base.black },
    ["@markup.italic.markdown_inline"]     = { italic = true },
    ["@markup.link.label.markdown_inline"] = { fg = c.base.red },
    ["@markup.link.url.markdown_inline"]   = { fg = c.base.green, underline = true },
    ["@markup.raw.block.markdown"]         = { bg = c.base.black },
    ["@markup.raw.delimiter.markdown"]     = { bg = c.base.black, fg = c.base.dimmed2 },
    ["@markup.strong.markdown_inline"]     = { bold = true },
    ["@none.markdown"]                     = { bg = c.base.black },
    ["@punctuation.special.markdown"]      = { fg = c.base.dimmed2 },
    ["@text.emphasis.markdown_inline"]     = { fg = c.base.white, italic = true },
    ["@text.literal.block.markdown"]       = { bg = c.editor.background },
    ["@text.literal.markdown_inline"]      = { bg = c.base.dimmed4, fg = c.base.white },
    ["@text.quote.markdown"]               = { bg = c.base.dimmed5, fg = c.base.white },
    ["@text.reference.markdown_inline"]    = { fg = c.base.red },
    ["@text.strong.markdown_inline"]       = { bold = true },
    ["@text.uri.markdown_inline"]          = { fg = c.base.green, sp = c.base.green, underline = true },

    -- TypeScript
    ["@type.typescript"]                   = { fg = c.base.cyan },
    ["@type.builtin.typescript"]           = { fg = c.base.cyan, italic = true },
    ["@type.definition.typescript"]        = { fg = c.base.cyan },
    ["@type.qualifier.typescript"]         = { fg = c.base.cyan },
    ["@constructor.typescript"]            = { fg = c.base.cyan },
    ["@function.typescript"]               = { fg = c.base.green },
    ["@function.call.typescript"]          = { fg = c.base.green },
    ["@function.method.typescript"]        = { fg = c.base.green },
    ["@function.method.call.typescript"]   = { fg = c.base.green },
    ["@variable.typescript"]               = { fg = c.base.white },
    ["@variable.member.typescript"]        = { fg = c.base.white },
    ["@variable.parameter.typescript"]     = { fg = c.base.orange, italic = true },
    ["@property.typescript"]               = { fg = c.base.white },
    ["@keyword.typescript"]                = { fg = c.base.red, italic = styles.keyword.italic },
    ["@keyword.type.typescript"]           = { fg = c.base.red, italic = styles.keyword.italic },
    ["@keyword.function.typescript"]       = { fg = c.base.red, italic = styles.keyword.italic },
    ["@keyword.return.typescript"]         = { fg = c.base.red },
    ["@keyword.export.typescript"]         = { fg = c.base.red },
    ["@keyword.import.typescript"]         = { fg = c.base.red },
    ["@keyword.coroutine.typescript"]      = { fg = c.base.red },
    ["@constant.typescript"]               = { fg = c.base.magenta },
    ["@constant.builtin.typescript"]       = { fg = c.base.magenta },
    ["@punctuation.bracket.typescript"]    = { fg = c.base.white },
    ["@punctuation.delimiter.typescript"]  = { fg = c.base.dimmed2 },
    ["@operator.typescript"]               = { fg = c.base.red },

    -- JavaScript
    ["@type.javascript"]                   = { fg = c.base.cyan },
    ["@type.builtin.javascript"]           = { fg = c.base.cyan, italic = true },
    ["@constructor.javascript"]            = { fg = c.base.cyan },
    ["@function.javascript"]               = { fg = c.base.green },
    ["@function.call.javascript"]          = { fg = c.base.green },
    ["@function.method.javascript"]        = { fg = c.base.green },
    ["@function.method.call.javascript"]   = { fg = c.base.green },
    ["@variable.javascript"]               = { fg = c.base.white },
    ["@variable.member.javascript"]        = { fg = c.base.white },
    ["@variable.parameter.javascript"]     = { fg = c.base.orange, italic = true },
    ["@property.javascript"]               = { fg = c.base.white },
    ["@keyword.javascript"]                = { fg = c.base.red, italic = styles.keyword.italic },
    ["@keyword.function.javascript"]       = { fg = c.base.red, italic = styles.keyword.italic },
    ["@keyword.return.javascript"]         = { fg = c.base.red },
    ["@keyword.export.javascript"]         = { fg = c.base.red },
    ["@keyword.import.javascript"]         = { fg = c.base.red },
    ["@keyword.coroutine.javascript"]      = { fg = c.base.red },
    ["@constant.javascript"]               = { fg = c.base.magenta },
    ["@constant.builtin.javascript"]       = { fg = c.base.magenta },
    ["@punctuation.bracket.javascript"]    = { fg = c.base.white },
    ["@punctuation.delimiter.javascript"]  = { fg = c.base.dimmed2 },
    ["@operator.javascript"]               = { fg = c.base.red },

    -- TSX (TypeScript React)
    ["@type.tsx"]                          = { fg = c.base.cyan },
    ["@type.builtin.tsx"]                  = { fg = c.base.cyan, italic = true },
    ["@type.definition.tsx"]               = { fg = c.base.cyan },
    ["@constructor.tsx"]                   = { fg = c.base.cyan },
    ["@function.tsx"]                      = { fg = c.base.green },
    ["@function.call.tsx"]                 = { fg = c.base.green },
    ["@function.method.tsx"]               = { fg = c.base.green },
    ["@function.method.call.tsx"]          = { fg = c.base.green },
    ["@variable.tsx"]                      = { fg = c.base.white },
    ["@variable.member.tsx"]               = { fg = c.base.white },
    ["@variable.parameter.tsx"]            = { fg = c.base.orange, italic = true },
    ["@property.tsx"]                      = { fg = c.base.white },
    ["@keyword.tsx"]                       = { fg = c.base.red, italic = styles.keyword.italic },
    ["@keyword.type.tsx"]                  = { fg = c.base.red, italic = styles.keyword.italic },
    ["@keyword.function.tsx"]              = { fg = c.base.red, italic = styles.keyword.italic },
    ["@keyword.return.tsx"]                = { fg = c.base.red },
    ["@keyword.export.tsx"]                = { fg = c.base.red },
    ["@keyword.import.tsx"]                = { fg = c.base.red },
    ["@constant.tsx"]                      = { fg = c.base.magenta },
    ["@constant.builtin.tsx"]              = { fg = c.base.magenta },
    ["@punctuation.bracket.tsx"]           = { fg = c.base.white },
    ["@punctuation.delimiter.tsx"]         = { fg = c.base.dimmed2 },
    ["@operator.tsx"]                      = { fg = c.base.red },
    ["@tag.tsx"]                           = { fg = c.base.red },
    ["@tag.builtin.tsx"]                   = { fg = c.base.red },
    ["@tag.attribute.tsx"]                 = { fg = c.base.orange, italic = true },
    ["@tag.delimiter.tsx"]                 = { fg = c.base.dimmed2 },

    -- JSX (JavaScript React)
    ["@type.jsx"]                          = { fg = c.base.cyan },
    ["@type.builtin.jsx"]                  = { fg = c.base.cyan, italic = true },
    ["@constructor.jsx"]                   = { fg = c.base.cyan },
    ["@function.jsx"]                      = { fg = c.base.green },
    ["@function.call.jsx"]                 = { fg = c.base.green },
    ["@function.method.jsx"]               = { fg = c.base.green },
    ["@function.method.call.jsx"]          = { fg = c.base.green },
    ["@variable.jsx"]                      = { fg = c.base.white },
    ["@variable.member.jsx"]               = { fg = c.base.white },
    ["@variable.parameter.jsx"]            = { fg = c.base.orange, italic = true },
    ["@property.jsx"]                      = { fg = c.base.white },
    ["@keyword.jsx"]                       = { fg = c.base.red, italic = styles.keyword.italic },
    ["@keyword.function.jsx"]              = { fg = c.base.red, italic = styles.keyword.italic },
    ["@keyword.return.jsx"]                = { fg = c.base.red },
    ["@keyword.export.jsx"]                = { fg = c.base.red },
    ["@keyword.import.jsx"]                = { fg = c.base.red },
    ["@constant.jsx"]                      = { fg = c.base.magenta },
    ["@constant.builtin.jsx"]              = { fg = c.base.magenta },
    ["@punctuation.bracket.jsx"]           = { fg = c.base.white },
    ["@punctuation.delimiter.jsx"]         = { fg = c.base.dimmed2 },
    ["@operator.jsx"]                      = { fg = c.base.red },
    ["@tag.jsx"]                           = { fg = c.base.red },
    ["@tag.builtin.jsx"]                   = { fg = c.base.red },
    ["@tag.attribute.jsx"]                 = { fg = c.base.orange, italic = true },
    ["@tag.delimiter.jsx"]                 = { fg = c.base.dimmed2 },

    -- SCSS
    ["@function.scss"]                     = { fg = c.base.cyan },
    ["@keyword.scss"]                      = { fg = c.base.red },
    ["@number.scss"]                       = { fg = c.base.magenta },
    ["@property.scss"]                     = { fg = c.base.green },
    ["@string.scss"]                       = { fg = c.base.blue, italic = true },
    ["@type.scss"]                         = { fg = c.base.cyan },

    -- Lua
    ["@comment.documentation.lua"]        = { fg = c.base.cyan },
    ["@conditional.lua"]                  = { fg = c.base.red },
    ["@field.lua"]                        = { fg = c.base.white },
    ["@function.builtin.lua"]             = { fg = c.base.green },
    ["@keyword.function.lua"]             = { fg = c.base.red },
    ["@keyword.lua"]                      = { fg = c.base.red, italic = styles.keyword.italic },
    ["@namespace.lua"]                    = { fg = c.base.red },
    ["@parameter.lua"]                    = { fg = c.base.orange, italic = true },
    ["@variable.lua"]                     = { fg = c.base.white },

    -- Yaml
    ["@number.yaml"]                      = { fg = c.base.magenta },
    ["@property.yaml"]                    = { fg = c.base.red },
    ["@punctuation.special.yaml"]         = { fg = c.base.white },
    ["@string.yaml"]                      = { fg = c.base.yellow },
  }
  for i = 1, 9 do
    spec["@markup.heading." .. i .. ".markdown"] = { fg = c.base.yellow }
    spec["@markup.heading." .. i .. ".marker.markdown"] = { fg = c.base.dimmed2 }
  end
  return spec
end

return M
