set splitbelow splitright

filetype plugin on
set clipboard=unnamedplus

"vnoremap y :w !xclip -i -sel c<CR><CR>
"nnoremap p :r !xclip -o -sel c<CR>
	 
function Rand()
    return str2nr(matchstr(reltimestr(reltime()), '\v\.@<=\d+')[1:])
endfunction

"let g:randomPath=rand()
"let g:cCommand="<ESC>:!gcc % -o /tmp/vim.".g:randomPath
"command -nargs=0 CompileC g:cCommand
"map <F8> g:cCommand

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


set cpoptions-=C
set nocompatible
let mapleader=","
nnoremap <Space> <Nop>
let g:ctrlp_map='<leader>.'

function! SourceConfigFile(name)
    let path = expand("~/.vim/plugin.config/" . a:name)
    if filereadable(l:path)
        execute "source ".fnameescape(l:path)
    else
        echom "config file ".a:name." is not readable."
    endif
endfunction

inoremap <C-j>  <Esc>/<++><Enter>"_c4l
map <C-j>  <Esc>/<++><Enter>"_c4l
"let g:clang_library_path="/usr/lib/llvm/11/lib64/libclang.so"
call plug#begin('~/.vim/plugged')
Plug 'davidhalter/jedi-vim'
Plug 'junegunn/goyo.vim'
Plug 'morhetz/gruvbox'
Plug 'thaerkh/vim-workspace'
Plug 'szw/vim-tags'
Plug 'lervag/vimtex'
Plug 'preservim/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdtree'
Plug 'dbeniamine/vim-compile'
Plug 'sukima/xmledit'
"Plug 'andymass/vim-matchup' , {'for': 'xml,html,python3'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
"Plug 'prabirshrestha/vim-lsp'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'rhysd/vim-clang-format'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plug 'vim-autoformat/vim-autoformat'
Plug 'skywind3000/asyncrun.vim'
Plug 'valloric/youcompleteme', { 'for': 'python' }
Plug 'kylechui/nvim-surround'
call plug#end()
"autocmd FileType python Plug 'valloric/youcompleteme'
"autocmd FileType c,cc,cpp,h,hpp,hh set omnifunc=syntaxcomplete#Complete
call SourceConfigFile("nerdtree.vim")
autocmd FileType python call SourceConfigFile("python.vim")
autocmd FileType c,cc,cpp,h,hpp,hh call SourceConfigFile("c-config.vim")
"call SourceConfigFile("xml.vim")
"let g:syntastic_python_flake8_args = "--ignore=E225,E226"
"let g:syntastic_python_checkers=['flake8']
au BufNewFile, BufRead *.py :
	\ set tabstop=4
	\ set softtabstop=4
	\ set shiftwidth=4
	\ set textwidth=79
	\ set expandtab
	\ set autoindent
	\ set fileformat=unix

map <leader>f :Goyo \| set linebreak <CR>

let g:ycm_clangd_args = ['--fallback-style=file']
let g:clang_format#style_options = {
	\ "Language": "Cpp",
	\ "BasedOnStyle": "Google",
	\ "AlignConsecutiveAssignments": "None",
	\ "AlignConsecutiveDeclarations": "None",
	\ "AlignEscapedNewlines": "Right",
	\ "AlignOperands": "Align",
	\ "AlignTrailingComments": "true",
	\ "AlignAfterOpenBracket": "DontAlign",
	\ "AllowAllParametersOfDeclarationOnNextLine": "true",
	\ "AllowShortBlocksOnASingleLine": "Never",
	\ "AllowShortCaseLabelsOnASingleLine": "false",
	\ "AllowShortFunctionsOnASingleLine": "Empty",
	\ "AllowShortIfStatementsOnASingleLine": "false",
	\ "AllowShortLoopsOnASingleLine": "false",
	\ "AlwaysBreakAfterReturnType": "None",
	\ "AlwaysBreakBeforeMultilineStrings": "false",
	\ "AllowAllArgumentsOnNextLine": "false",
	\ "BinPackArguments": "true",
	\ "BinPackParameters": "false",
	\ "BreakBeforeBinaryOperators": "All",
	\ "BreakBeforeTernaryOperators": "true",
	\ "BreakStringLiterals": "true",
	\ "ForEachMacros": [
	\ "ADT_LIST_FOREACH",
	\ "ADT_LIST_FOREACH_FIRST",
	\ "ADT_LIST_FOREACH_SAFE" ],
	\ "SortIncludes": "Never",
	\ "IndentCaseLabels": "false",
	\ "IndentPPDirectives": "None",
	\ "IndentWrappedFunctionNames": "false",
	\ "KeepEmptyLinesAtTheStartOfBlocks": "false",
	\ "PenaltyReturnTypeOnItsOwnLine": 60,
	\ "PenaltyBreakBeforeFirstCallParameter": 200,
	\ "PenaltyBreakAssignment": 300,
	\ "PenaltyBreakString": 1000,
	\ "PenaltyBreakComment": 2000,
	\ "PenaltyExcessCharacter": 3000,
	\ "PointerAlignment": "Right",
	\ "DerivePointerAlignment": "false",
	\ "ReflowComments": "false",
	\ "SpaceBeforeAssignmentOperators": "true",
	\ "SpaceInEmptyParentheses": "false",
	\ "SpacesBeforeTrailingComments": 1,
	\ "SpacesInContainerLiterals": "false",
	\ "SpacesInParentheses": "false",
	\ "SpacesInSquareBrackets": "false",
	\ "IndentWidth": 4,
	\ "TabWidth": 4,
	\ "UseTab": "Never",
	\ "ContinuationIndentWidth": 4,
	\ "BreakBeforeBraces": "Custom",
	\ "BraceWrapping":{
	\ "AfterClass": "false",
	\ "AfterCaseLabel": "true",
	\ "AfterEnum": "false",
	\ "AfterFunction": "true",
	\ "AfterNamespace": "false",
	\ "AfterStruct": "false",
	\ "AfterUnion": "false",
	\ "AfterExternBlock": "false",
	\ "BeforeCatch": "false",
	\ "BeforeElse": "false",
	\ "IndentBraces": "false",
	\ "SplitEmptyFunction": "false",
	\ "SplitEmptyRecord": "false",
	\ "SplitEmptyNamespace": "false"},
	\ "MaxEmptyLinesToKeep": 1,
	\ "ColumnLimit": 80,
	\ "SpaceBeforeParens": "ControlStatements",
	\ "SpaceAfterCStyleCast": "false",
	\ "SpacesInCStyleCastParentheses": "false"}
set encoding=utf-8
set number relativenumber
set wildmode=longest,list,full
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
set background=dark

noremap <leader>y "*y
noremap <leader>p "*p
noremap <leader>Y "+y
noremap <leader>P "+p
inoremap {<CR> {<CR>}<C-o>O 

	inoremap (<CR> (<CR>)<C-o>O 
	inoremap [<CR> [<CR>]<C-o>O 
	inoremap /*<CR> /*<CR>*/<C-o>O 
let g:AutocorrectPersonalFile= '~/.config/autocorrect.text'
 hi clear SpellBad
 hi SpellBad cterm=underline
 hi clear SpellRare
 hi SpellRare cterm=underline
 hi clear SpellCap
 hi SpellCap cterm=underline
 hi clear SpellLocal
 hi SpellLocal cterm=underline

let g:clang_library_path='/usr/lib/libclang.so'
let g:AutocorrectFiletypes = ["text","markdown","tex"]
syntax enable
nnoremap <F5> :setlocal spell spelllang=en_us <Enter> :syntax spell toplevel <Enter> <C-l>
nnoremap <F6> :set nospell <Enter>
let g:airline#extensions#tabline#enabled = 1
autocmd VimEnter * AirlineTheme dark
autocmd FileType c ClangFormatAutoEnable
let g:clang_format#auto_format_on_insert_leave=1
let g:clang_format#detect_style_file=1
let g:clang_format#enable_fallback_style=0
let g:clang_format#auto_filetypes = ["c", "cpp", "h", "hpp"]
nmap <Leader>C :ClangFormatAutoToggle<CR>
autocmd FileType c,cxx,cpp,h,hpp,hxx,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cxx,cpp,h,hpp,hxx,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>



"autocmd FileType python set omnifunc=jedi#completion#OmniFunc
"autocmd FileType python set g:jedi#completions_enabled=1
autocmd FileType python noremap <C-o> :! clear; python3 % <CR>
autocmd FileType python noremap () (,)<++><Esc>F,s
autocmd FileType python noremap "" ","<++><Esc>F,s
autocmd BufWritePre *.py :%s/\s\+$//e
let g:jedi#completions_enabled = 0
nmap <F8> :TagbarToggle<CR>
" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <C-m> :bp<CR>
nnoremap <C-n> :bn<CR>
"autocmd FileType python au BufWrite * :Autoformat
"let g:formatdef_ruff = "'autopep8 - --range '.a:firstline.' '.a:lastline"
let g:formatdef_ruff = "'ruff format - --range '.a:firstline.' '.a:lastline"
let g:formatters_python = ['ruff']

let NERDTreeQuitOnOpen=1

" make sure that viewer is selected according to the suffix.
let g:netrw_browsex_viewer="-"
" functions for file extension '.md'.
function! NFH_md(f)
    call asyncrun#run("", "cwd", "typora " . a:f)
endfunction

" functions for file extension '.pdf'.
function! NFH_pdf(f)
    call asyncrun#run("", "cwd" , "atril " . a:f)
endfunction

" functions for file extension '.html'.
function! NFH_html(f)
    call asyncrun#run("", "cwd", "firefox --new-window " . a:f)
endfunction

let g:vim_tags_main_file = '~/tags'
let g:match_up_surround_enabled = 1

