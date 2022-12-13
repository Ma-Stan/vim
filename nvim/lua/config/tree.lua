-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- parser_config.cpp = {
--   install_info = {
--     url = "~/git/tree-sitter-cpp", -- local path or git repo
--     files = {"src/parser.c","src/scanner.cc"}
--   },
--   -- filetype = "zu", -- if filetype does not agrees with parser name
--   -- used_by = {"bar", "baz"} -- additional filetypes that use this parser
-- }

require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = {"cpp","python"},
  -- ensure_installed = {"python"},

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  -- ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    -- disable = { "c", "rust" },
    -- disable = { "cpp" },
    -- disable = { "python" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  -- indent = {
  --     enable = true,
  -- },
}
