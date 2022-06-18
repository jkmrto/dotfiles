" ALE configuration

nnoremap <Leader>aa :ALEToggle<CR>
nnoremap <Leader>ad :ALEGoToDefinition<CR>
nnoremap <Leader>ai :ALEInfo<CR>

" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:ale_set_signs = 1

" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

"let g:ale_completion_enabled = 1
let g:ale_open_list = 1

" Execute linter and fixer only on save
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1

highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_linters_explicit = 1

"Use Quickfix list instead of Locactionlist
let g:ale_set_quickfix = 1
let g:ale_set_loclist = 0

" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1

" Avoid golint and go vet by default to avoid style warnings
let g:ale_linters = {
\	'Dockerfile': ['hadolint'],
\	'elm': ['elm_ls'],
\	'go': ['go build', 'go vet', 'golint'],
\	'graphql': ['gqlint'],
\	'yaml': ['yamllint'],
\ 'typescript': ['tsserver'],
\ 'javascript'  : ['eslint'],
\ }

let g:ale_fixers = {
\ 'elm': ['elm-format'],
\ 'graphql': ['prettier'],
\ 'typescript': ['prettier'],
\ 'json': ['prettier'],
\ 'jsx': ['prettier'],
\ 'javascript': ['prettier'],
\ 'rust': ['rustfmt'],
\ 'eelixir': ['remove_trailing_lines', 'trim_whitespace'],
\ }


echo "ALE setup loaded"
