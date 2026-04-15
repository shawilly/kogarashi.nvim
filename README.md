<p align="center">
  <a href="https://github.com/shawilly/ponokai.nvim/stargazers"><img src="https://img.shields.io/github/stars/shawilly/ponokai.nvim?colorA=192330&colorB=f8e7b0&style=for-the-badge"></a>
  <a href="https://github.com/shawilly/ponokai.nvim/issues"><img src="https://img.shields.io/github/issues/shawilly/ponokai.nvim?colorA=192330&colorB=98d4e7&style=for-the-badge"></a>
  <a href="https://github.com/shawilly/ponokai.nvim/contributors"><img src="https://img.shields.io/github/contributors/shawilly/ponokai.nvim?colorA=192330&colorB=b4e49a&style=for-the-badge"></a>
  <a href="https://github.com/shawilly/ponokai.nvim/network/members"><img src="https://img.shields.io/github/forks/shawilly/ponokai.nvim?colorA=192330&colorB=bdb2ff&style=for-the-badge"></a>
</p>

<div align="center">
<h1>Kogarashi for Neovim</h1>
 <br>
 <a href="https://github.com/shawilly/ponokai.nvim">
  <img src="logo.svg" width="800" height="400" alt="Click to see the source">
 </a>
 <br>
</div>

Kogarashi is a Neovim color scheme and Vim theme for daily development, terminal use, and plugin integrations.

The project is still in beta. If you want the Vim version of Ponokai, use [shawilly/ponokai](https://github.com/shawilly/ponokai).

Find out more here [ponokai.pro](https://ponokai.pro/)

![kogarashi-macbook](https://user-images.githubusercontent.com/80513079/218453999-87c957f1-658d-49a6-bf67-291d3e46fa9a.png)

## ⭐ Theme

![kogarashi](https://user-images.githubusercontent.com/80513079/209659184-ed5a28c3-cb7f-4de7-8f7c-5d206dc11540.png)

### 🔌 Plugin support

- [alpha-nvim](https://github.com/goolord/alpha-nvim)
- [bufferLine.nvim](https://github.com/akinsho/bufferline.nvim)
- [Cmp](https://github.com/hrsh7th/nvim-cmp)
- [copilot.lua](https://github.com/zbirenbaum/copilot.lua)
- [nvim-dap](https://github.com/mfussenegger/nvim-dap)
- [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
- [diffview.nvim](https://github.com/sindrets/diffview.nvim)
- [dropbar.nvim](https://github.com/Bekaboo/dropbar.nvim)
- [flash.nvim](https://github.com/folke/flash.nvim)
- [harpoon](https://github.com/ThePrimeagen/harpoon)
- [hop.nvim](https://github.com/phaazon/hop.nvim)
- [vim-illuminate](https://github.com/RRethy/vim-illuminate)
- [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- [leap.nvim](https://github.com/ggandor/leap.nvim)
- [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [neogit](https://github.com/NeogitOrg/neogit)
- [nvim-notify](https://github.com/rcarriga/nvim-notify)
- [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim)
- [renamer.nvim](https://github.com/filipdutescu/renamer.nvim)
- [snacks.nvim](https://github.com/folke/snacks.nvim)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)
- [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
- [trouble.nvim](https://github.com/folke/trouble.nvim)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [which-key.nvim](https://github.com/folke/which-key.nvim)
- [breadcrumb.nvim](https://github.com/shawilly/breadcrumb.nvim)
- [nvim-navic](https://github.com/SmiteshP/nvim-navic)
- [wilder.nvim](https://github.com/gelguy/wilder.nvim)
- [Lightline](https://github.com/itchyny/lightline.vim)
- [barbecue.nvim](https://github.com/utilyre/barbecue.nvim)
- [dashboard-nvim](https://github.com/glepnir/dashboard-nvim)
- [mason.nvim](https://github.com/williamboman/mason.nvim)
- [nvim-ts-rainbow2](https://github.com/HiPhish/nvim-ts-rainbow2)
- [rainbow-delimeters.nvim](https://gitlab.com/HiPhish/rainbow-delimiters.nvim)

## 📦 Installation

[vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'shawilly/ponokai.nvim'
```

[packer](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "shawilly/ponokai.nvim",
  config = function()
    require("kogarashi").setup()
  end
}
```

[lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "shawilly/ponokai.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function(_, opts)
    require("kogarashi").setup(opts)
    vim.cmd.colorscheme("kogarashi")
  end,
}
```

### LazyVim

Create `lua/plugins/colorscheme.lua`:

```lua
return {
  {
    "shawilly/ponokai.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent_background = false,
    },
    config = function(_, opts)
      require("kogarashi").setup(opts)
      vim.cmd.colorscheme("kogarashi")
    end,
  },
}
```

## 🖼️ Screenshots

If you want a repeatable setup for taking screenshots, use [`examples/screenshots.lua`](examples/screenshots.lua).
Launch it with `nvim --clean -S examples/screenshots.lua` to open a scratch buffer that renders every active highlight group.
It also clears common floating backgrounds and turns on `nvim-web-devicons` highlights so screenshots look consistent.

![highlight-groups-screenshot](screenshot.png)

## 🔨 Configuration

Example configuration:

```lua
require("kogarashi").setup({
  transparent_background = false,
  terminal_colors = true,
  devicons = true, -- highlight the icons of `nvim-web-devicons`
  styles = {
    comment = { italic = true },
    keyword = { italic = true }, -- any other keyword
    type = { italic = true }, -- (preferred) int, long, char, etc
    storageclass = { italic = true }, -- static, register, volatile, etc
    structure = { italic = true }, -- struct, union, enum, etc
    parameter = { italic = true }, -- parameter pass in function
    annotation = { italic = true },
    tag_attribute = { italic = true }, -- attribute of tag in reactjs
  },
  inc_search = "background", -- underline | background
  background_clear = {
    -- "float_win",
    "toggleterm",
    "telescope",
    -- "which-key",
    "renamer",
    "notify",
    -- "nvim-tree",
    -- "neo-tree",
    -- "bufferline", -- better used if background of `neo-tree` or `nvim-tree` is cleared
  },-- "float_win", "toggleterm", "telescope", "which-key", "renamer", "neo-tree", "nvim-tree", "bufferline"
  plugins = {
    bufferline = {
      underline_selected = false,
      underline_visible = false,
    },
    indent_blankline = {
      context_highlight = "default", -- default | accent
      context_start_underline = false,
    },
  },
  ---@param c Colorscheme
  override = function(c) end,
  ---@param cs Colorscheme
  ---@param p ColorschemeOptions
  ---@param Config KogarashiOptions
  ---@param hp Helper
  override = function(cs: Colorscheme, p: ColorschemeOptions, Config: KogarashiOptions, hp: Helper) end,
})
```

- Check my [nvim](https://github.com/shawilly/nvim) to see my plugins setup for `border` if you want to set `background_clear`

For example:

<details>
  <summary>float_win</summary>

```lua
require("kogarashi").setup({
    -- ... your config
    background_clear = { "float_win" }
    -- ... your config
})

require("cmp").setup({
    -- ... your config
    window = {
      border = "rounded",
    }
    completion = {
        border = "rounded",
    }
    -- ... your config
})
```

- With the above config:
  ![bg_clear_cmp](https://user-images.githubusercontent.com/80513079/218801625-a2b43cb0-175c-4463-9290-a361deb41f6a.png)

- With the default config:
  ![default_cmp](https://user-images.githubusercontent.com/80513079/218804686-834c624d-d9bf-45a1-a1bd-a6d05e70e1b8.png)

</details>

<details>
  <summary>Telescope</summary>

```lua
require("kogarashi").setup({
    -- ... your config
    background_clear = {}
    -- ... your config
})

require("telescope").setup({
    -- ... your config
    defaults = {
      borderchars = { "█", " ", "▀", "█", "█", " ", " ", "▀" },
    }
    -- ... your config
})
```

- With the above config:

![removed_border_telescope](https://user-images.githubusercontent.com/80513079/218804055-a5cbf9d4-5c0f-4c0f-9cfe-5362af3714e8.png)

- With the default config:
  ![default_telescope](https://user-images.githubusercontent.com/80513079/218803566-56852087-8d3c-410c-854a-89bb49f8d981.png)

</details>

## 📚 Usage

- Enable this colorscheme by using the following command after `setup`:

```vim
" Vim Script
colorscheme kogarashi
```

```lua
require("kogarashi").setup({
  -- ... your config
})
-- lua
vim.cmd([[colorscheme kogarashi]])
```

- To enable `kogarashi` for `Lualine`:

```lua
require('lualine').setup {
  options = {
    -- ...
    theme = 'kogarashi'
    -- ...
  }
}
```

- To enable `kogarashi` for `barbecue`:

```lua
require('barbecue').setup {
  -- ...
  theme = 'kogarashi'
  -- ...
}

```

- To enable `kogarashi` for `lightline`:

```vim
" Vim Script
let g:lightline = {'colorscheme': 'kogarashi'}
```

- Override function for customizing the final color scheme:

```lua
require("kogarashi").setup({
    -- ...
    override = function()
      return {
          Normal = { bg = "#000000" }
        }
    end
    -- ...
  })
```

- Customize your own palette:

This is a sample config to use `Tokyonight` as the palette:

```lua
require("kogarashi").setup({
    -- ...
    override = function(c)
      return {
        IndentBlanklineChar = { fg = c.base.dimmed4 },
      }
    end,
    overridePalette = function()
      return {
        dark2 = "#101014",
        dark1 = "#16161E",
        background = "#1A1B26",
        text = "#C0CAF5",
        red = "#f7768e",
        orange = "#7aa2f7",
        yellow = "#e0af68",
        green = "#9ece6a",
        blue = "#0DB9D7",
        purple = "#9d7cd8",
        dimmed1 = "#737aa2",
        dimmed2 = "#787c99",
        dimmed3 = "#363b54",
        dimmed4 = "#363b54",
        dimmed5 = "#16161e",
      }
    end
    -- ...
  })
```

- Customize the scheme:

This is a sample config to use a darker background for almost all supported plugins:

```lua
require("kogarashi").setup({
    -- ...
    overrideScheme = function(cs, p, config, hp)
      local cs_override = {}
      local calc_bg = hp.blend(p.background, 0.75, '#000000')

      cs_override.editor = {
        background = calc_bg,
      }
      return cs_override
    end
    -- ...
  })
```
