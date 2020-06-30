" vim-bootstrap 564604c

"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
if has('vim_starting')
  set nocompatible               " Be iMproved
endif

let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

let g:vim_bootstrap_langs = "c,elm,html,lua,perl,php,python,ruby"
let g:vim_bootstrap_editor = "nvim"				" nvim or vim

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'makerj/vim-pdf'
Plug 'gorodinskiy/vim-coloresque'
" Plug 'ap/vim-css-color'
Plug 'dylanaraps/wal.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'suan/vim-instant-markdown'
Plug 'chrisbra/colorizer'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'zchee/deoplete-clang'
Plug 'chrisbra/sudoedit.vim'
Plug 'kana/vim-operator-user'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/grep.vim'
Plug 'vim-scripts/CSApprox'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/syntastic'
Plug 'Yggdroot/indentLine'
Plug 'avelino/vim-bootstrap-updater'
Plug 'sheerun/vim-polyglot'
Plug 'jtratner/vim-flavored-markdown'
if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif
let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif

Plug 'Shougo/vimproc.vim', {'do': g:make}

"" Vim-Session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

if v:version >= 703
  Plug 'Shougo/vimshell.vim'
endif

if v:version >= 704
  "" Snippets
  Plug 'SirVer/ultisnips'
endif

Plug 'honza/vim-snippets'

"" Color
Plug 'tomasr/molokai'
Plug 'colepeters/spacemacs-theme.vim'

"*****************************************************************************
"" Custom bundles
"*****************************************************************************

""general
Plug 'vim-scripts/AutoComplPop'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'majutsushi/tagbar'
Plug 'flazz/vim-colorschemes'

" Plug 'myint/clang-complete'
Plug 'vim-scripts/clang-complete'
Plug 'vim-scripts/a.vim'
Plug 'gcollura/vim-masm'
Plug 'godlygeek/tabular'
Plug 'vim-scripts/ingo-library'
Plug 'vim-scripts/SyntaxRange'
Plug 'ludwig/split-manpage.vim'

" c
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
Plug 'ludwig/split-manpage.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'google/vim-colorscheme-primary'
Plug 'meiraka/vim-google-cpp-style-indent'
Plug 'rhysd/vim-clang-format'


" elm
"" Elm Bundle
Plug 'elmcast/elm-vim'


" html
"" HTML Bundle
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'


" lua
"" Lua Bundle
Plug 'xolox/vim-lua-ftplugin'
Plug 'xolox/vim-lua-inspect'


" perl
"" Perl Bundle
Plug 'vim-perl/vim-perl'
Plug 'c9s/perlomni.vim'


" php
"" PHP Bundle
Plug 'arnaud-lb/vim-php-namespace'


" python
"" Python Bundle
Plug 'davidhalter/jedi-vim'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}


" ruby
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-projectionist'
Plug 'thoughtbot/vim-rspec'
Plug 'ecomba/vim-ruby-refactoring'

Plug 'ervandew/supertab'
"*****************************************************************************
"*****************************************************************************

"" Include user's extra bundle
if filereadable(expand("~/.config/nvim/local_bundles.vim"))
  source ~/.config/nvim/local_bundles.vim
endif

call plug#end()

" Required:
filetype plugin indent on


"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary


"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Map leader to ,
let mapleader=','

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac

if exists('$SHELL')
    set shell=/bin/zsh
else
    set shell=/bin/zsh
endif

" session management
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number

let no_buffers_menu=1
if !exists('g:not_finish_vimplug')
   " colorscheme molokai
   colorscheme wal
   " colorscheme codedark
endif

set mousemodel=popup
set t_Co=256
set t_ut=
set guioptions=egmrti
set gfn=Monospace\ 10
set enc=utf-8
" set guifont=Powerline_Consolas:h11
" set renderoptions=type:directx,gamma:1.5,contrast:0.5,geom:1,renmode:5,taamode:1,level:0.5
if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=Menlo:h12
    set transparency=7
  endif
else
  let g:CSApprox_loaded = 1

  " IndentLine
  let g:indentLine_enabled = 1
  let g:indentLine_concealcursor = 0
  let g:indentLine_char = '┆'
  let g:indentLine_faster = 1

endif

if has('nvim')
""	map td :15Term zsh <CR>
""	map ts :VTerm zsh <CR>
  map td :split term://zsh<CR>
  map ts :vsplit term://zsh<CR>
endif

"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" vim-airline
" let g:airline_theme = 'powerlineish'
" let g:airline_theme = 'deus'
let g:airline_theme = 'wal'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:nerdtree_tabs_autoclose = 1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
noremap <F3> :NERDTreeToggle<CR>

" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

" vimshell.vim
" let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
" let g:vimshell_prompt =  '$ '

" terminal emulation
" if g:vim_bootstrap_editor == 'nvim'
"   nnoremap <silent> <leader>sh :terminal<CR>
" else
  nnoremap <silent> <leader>sh :VimShellCreate<CR>
" endif

"*****************************************************************************
"" Functions
"*****************************************************************************
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set nowrap
    set wm=2
    set textwidth=80
  endfunction
endif

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\""  | endif
augroup END

"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

set autoread

"*****************************************************************************
"" Mappings
"*****************************************************************************

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>e :FZF -m<CR>

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-a>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

" syntastic
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

let g:syntastic_nasm_checkers = ['nasm']
let g:syntastic_nasm_compiler = 'nasm'
let g:syntastic_nasm_pc_lint_args = "-f elf64"
let g:syntastic_nasm_config_file = '.config_nasm'

let g:syntastic_c_compiler = 'gcc'
let g:syntastic_c_config_file = '.clang_complete'
let g:syntastic_c_check_header = 1
let g:syntastic_c_no_include_search = 0
let g:syntastic_c_auto_refresh_includes = 1
let g:syntastic_auto_jump = 1

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_aggregate_errors = 1
let g:syntastic_quiet_messages = { "regex":  "but not used" }


" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
nmap <silent> <C-m> :TagbarOpenAutoClose<CR>
let g:tagbar_autofocus = 1

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

"" Close buffer
noremap <leader>c :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

noremap <C-A-up> :resize-5<CR>
noremap <C-A-Down> :resize+5<CR>
noremap <C-A-Left> :vertical resize-5<CR>
noremap <C-A-Right> :vertical resize+5<CR>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Open current line on GitHub
nnoremap <Leader>o :.Gbrowser<CR>

"*****************************************************************************
"" Custom configs
"*****************************************************************************

" c
au BufRead,BufNewFile *.c set filetype=c
au BufRead,BufNewFile *.cpp set filetype=cpp
au BufRead,BufNewFile *.h set filetype=c
au BufRead,BufNewFile *.hpp set filetype=cpp
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab


" elm
" elm-vim
let g:elm_setup_keybindings = 0
let g:elm_format_autosave = 1

" vim-polyglot
let g:polyglot_disabled = ['elm']

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:elm_syntastic_show_warnings = 0


" html
" for html files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab

" vim
au BufRead,BufNewFile *.vim set filetype=vim
autocmd Filetype vim setlocal ts=2 sw=2 expandtab

" lua


" perl


" php


" python
" vim-python
augroup vimrc-python
  autocmd!
  " autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
      \ formatoptions+=croq softtabstop=4
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0

" syntastic
let g:syntastic_python_checkers=['python', 'flake8']

" vim-airline
let g:airline#extensions#virtualenv#enabled = 1

" Syntax highlight
" Default highlight is better than polyglot
let g:polyglot_disabled = ['python']
let python_highlight_all = 1


" ruby
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

augroup vimrc-ruby
  autocmd!
  autocmd BufNewFile,BufRead *.rb,*.rbw,*.gemspec setlocal filetype=ruby
  autocmd FileType ruby set tabstop=4|set shiftwidth=4|set expandtab softtabstop=4
augroup END

let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" For ruby refactory
if has('nvim')
  runtime! macros/matchit.vim
else
  packadd! matchit
endif

" Ruby refactory
nnoremap <leader>rap  :RAddParameter<cr>
nnoremap <leader>rcpc :RConvertPostConditional<cr>
nnoremap <leader>rel  :RExtractLet<cr>
vnoremap <leader>rec  :RExtractConstant<cr>
vnoremap <leader>relv :RExtractLocalVariable<cr>
nnoremap <leader>rit  :RInlineTemp<cr>
vnoremap <leader>rrlv :RRenameLocalVariable<cr>
vnoremap <leader>rriv :RRenameInstanceVariable<cr>
vnoremap <leader>rem  :RExtractMethod<cr>


"*****************************************************************************
"*****************************************************************************

"" Include user's local vim config
if filereadable(expand("~/.config/nvim/local_init.vim"))
  source ~/.config/nvim/local_init.vim
endif

"*****************************************************************************
"" Convenience variables
"*****************************************************************************

" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g_rehash256 = 1
  let g:Powerline_symbols='unicode'
  let g:Powerline_theme='long'
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'

  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''


  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#right_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = '|'

  let g:airline_symbols.space     = "\ua0"
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

let g:split_manpage_prefix ='K'


let g:python3_host_prog = '/usr/bin/python'
let g:python_host_prog = '/usr/bin/python2.7'

let g:clang_exec = "/usr/bin/clang"
let g:clang_library_path = "/usr/lib64/"
let g:clang_close_preview = 1
let g:clang_use_library=1
let g:clang_snippets=0
let g:clang_complete_auto=0
let g:clang_complete_copen=1
let g:clang_conceal_snippets=1
let g:clang_snippets_engine='clang_complete'
let g:clang_trailing_placeholder=1
let g:clang_hl_errors=1
let g:clang_user_options = '.clang_complete'
let g:clang_complete_macros=1
let g:clang_complete_patterns=1

set concealcursor=inv
set conceallevel=2
set completeopt=menu,menuone
set pumheight=20

" let g:SuperTabDefaultCompletion='<c-x><c-u><c-p>'

" " clang-format
" let g:clang_format#detect_style_file = 1
" let g:clang_format#auto_format_on_insert_leave = 1
" let g:clang_format#enable_fallback_style = 0

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting
nmap <Leader>C :ClangFormatAutoToggle<CR>

" unwanted whitespace cleanup
" map <buffer><Leader>X :FixWhitespace<CR>
map <Leader>X :FixWhitespace<CR>

" asm filetypes settings
au BufRead,BufNewFile *.masm set filetype=masm
au BufRead,BufNewFile *.asm set filetype=nasm
au BufRead,BufNewFile *.s set filetype=asm

if !has('nvim')
	set ttymouse=xterm2
endif

set mouse=a

set nowrap
map bd :bd!<CR>

map <C-Right> :bn<CR>
map <C-Left> :bp<CR>

map <C-S-Left> :tabprev<CR>
map <C-S-Right> :tabnext<CR>

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" if (has("termguicolors"))
"   set termguicolors
" endif

" deoplete
" let g:deoplete#enable_at_startup = 1
" let g:deoplete_disable_auto_complete=1
" let g:deoplete#sources#clang#clang_path = '/usr/lib/libclang.so'
" let g:deoplete#sources#clang#clang_header = '/usr/lib/clang/8.0.0'
" call deoplete#custom#option('auto_complete', v:false)
"

" let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_ignore_case = 'ignorecase'
" let g:deoplete#sources = {}
" let g:deoplete#sources_ = ['buffer','tag']

" imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"     \ "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <expr><C-h>
"       \ deolete#mappings#smart_close_popup()."\<C-h>"
" inoremap <expr><BS>
"       \ deoplete#mappings#smart_close_popup()."\<C-h>"
" set completeopt+=noinsert
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#show_call_signatures = 0
set completeopt+=noinsert



" set background=dark
" colorscheme spacemacs-theme
hi Normal guibg=none ctermbg=none

tnoremap <A-Right> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-Left> <C-\><C-N><C-w>l
inoremap <A-right> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-left> <C-\><C-N><C-w>l
nnoremap <A-left> <C-w>h
nnoremap <A-down> <C-w>j
nnoremap <A-up> <C-w>k
nnoremap <A-right> <C-w>l

tnoremap <Esc> <C-\><C-n>

map <leader>i :startinsert<CR>

" NETRW
map <leader>V :Vex<CR>
map <leader>S :Sex<CR>

let g:netrw_banner = 0
let g:netrw_liststyle = 1
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_silent = 1

" Syntastic


" redo
map <leader>r :redo<CR>
map <leader>a :A<CR>

"colorizer (bash scaped colors)
map gh :ColorHighlight<CR>
map hg :ColorClear<CR>

"utils
"clean dos linefeed
map cl :e ++ff=dos<CR>:set ff=unix<CR> :FixWhitespace<CR>
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 1
let g:instant_markdown_allow_unsafe_content = 1
let g:instant_markdown_allow_external_content = 0
filetype plugin indent on 
let python_highlight_all = 1
