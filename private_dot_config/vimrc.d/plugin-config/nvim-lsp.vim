lua <<EOF
local on_attach_vim = function(client)
  require'completion'.on_attach(client)
  require'diagnostic'.on_attach(client)
end

-- require'nvim_lsp'.cmake.setup{on_attach=on_attach_vim}
-- require'nvim_lsp'.jedi_language_server.setup{on_attach=on_attach_vim}
-- require'nvim_lsp'.sqlls.setup{on_attach=on_attach_vim}
-- require'nvim_lsp'.vimls.setup{on_attach=on_attach_vim}
-- require'nvim_lsp'.cssls.setup{on_attach=on_attach_vim}
-- require'nvim_lsp'.ccls.setup{on_attach=on_attach_vim}
require'nvim_lsp'.bashls.setup{on_attach=on_attach_vim}
require'nvim_lsp'.codeqlls.setup{on_attach=on_attach_vim}
require'nvim_lsp'.diagnosticls.setup{on_attach=on_attach_vim}
require'nvim_lsp'.dockerls.setup{on_attach=on_attach_vim}
require'nvim_lsp'.gopls.setup{on_attach=on_attach_vim}
require'nvim_lsp'.html.setup{on_attach=on_attach_vim}
require'nvim_lsp'.jdtls.setup{on_attach=on_attach_vim}
require'nvim_lsp'.jsonls.setup{on_attach=on_attach_vim}
require'nvim_lsp'.pyls.setup{}
require'nvim_lsp'.rust_analyzer.setup{on_attach=on_attach_vim}
require'nvim_lsp'.sumneko_lua.setup{on_attach=on_attach_vim}
require'nvim_lsp'.terraformls.setup{
  on_attach=on_attach_vim;
  cmd = {"terraform-ls", "serve"};
}
require'nvim_lsp'.yamlls.setup{on_attach=on_attach_vim}
EOF

" I either want it off, or the trigger higher | default = 1
let g:completion_trigger_keyword_length = 3

" Not Sure if I want popping Up
let g:completion_enable_auto_popup      = 1
let g:completion_enable_auto_signature  = 1
let g:completion_enable_auto_hover      = 0
let g:completion_matching_ignore_case   = 0
let g:completion_enable_snippet         = 'UltiSnips'