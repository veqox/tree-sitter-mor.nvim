# tree-sitter-mor.nvim

tree-sitter-mor nvim integration

## Installation

```lua
{
    "veqox/tree-sitter-mor.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("tree-sitter-mor").setup()
    end,
    build = function()
        require("tree-sitter-mor").build()
    end
}

{
    "nvim-treesitter/nvim-treesitter",
    opts = {
        autoinstall = true,
        highlight = {
            enable = true
        },
    },
    config = function(_, opts)
        require("nvim-treesitter.parsers").get_parser_configs().mor = {
            install_info = {
                url = "github.com/veqox/tree-sitter-mor",
                files = { "src/parser.c" },
                branch = "main"
            },
            filetype = "mo"
        }

        require("nvim-treesitter.configs").setup(opts)
    end
}
```
