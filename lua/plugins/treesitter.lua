return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "c",
        "c++",
        "cs",
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
    lazy = false,
    branch = 'main',
    build = ':TSUpdate'
  }
}
