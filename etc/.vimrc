execute pathogen#infect()

" map leader
let mapleader = "\<space>"

" Color scheme stuff
set t_Co=256
if (has("termguicolors"))
 set termguicolors
endif

colorscheme gruvbox

" gruvbox stuff
let g:gruvbox_contrast_dark = 'hard'

set expandtab
retab

autocmd BufRead,BufNewFile   *.go set noexpandtab

set autoindent

map <Enter> o<ESC>
map <S-Enter> O<ESC>

" Nerdtree settings
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Syntax Highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" Syntax on, use old regexp engine for better performance
syntax on
set regexpengine=1
set lazyredraw
set ttyfast

highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\| \+\ze\t/

function! StripWhitespace ()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction

" NERDTree setting defaults to work around http://github.com/scrooloose/nerdtree/issues/489
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeGlyphReadOnly = "RO"

" RSpec.vim mappings
map <leader>f :w!<CR> :call RunCurrentSpecFile()<CR>
map <Leader>s :w!<CR> :call RunNearestSpec()<CR>
map <Leader>a :w!<CR> :call RunAllSpecs()<CR>
let g:rspec_runner = "os_x_iterm"
let g:rspec_command = "!bundle exec rspec {spec}"

" run the current file with ruby
map <leader>r :!ruby %<CR>

" indent whole file
map <leader>= mmgg=G`m

" add binding.pry on the following line
map <leader>b Obinding.pry<ESC>j

set backupdir=~/.tmp
set directory=~/.tmp " Don't clutter my dirs up with swp and tmp files

" mitigate holding shift for too long
command! Q q " Bind :Q to :q
command! Wq wq

" Custom split hotkeys for FZF
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

" Word motion settings
let g:wordmotion_spaces = '_-.'

" ========================================================================================
" Settings below this line are the result of informed decisions, those above
" were probably copy/pasted

" " Show number on cursor line and relative numbers on other lines
" set relativenumber
 set number
" autocmd InsertEnter * :set number norelativenumber
" autocmd InsertLeave * :set relativenumber

" Always show the status line at the bottom of the page
" http://vim.wikia.com/wiki/Displaying_status_line_always
set laststatus=2

" Highlights f/?{char} results
set hls

" clear highlights from last search
map <leader>h :nohlsearch<cr>

" Highlights f/?{char} matches as you type
set incsearch

" Treat all numbers as decimals (as opposed to octal, etc.)
set nrformats=

" Setting tabs to equal 2 spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Set yank/put to use system clipboard (requires higher ViM than os x default)
set clipboard=unnamed

" Map jj to <esc> in insert mode
imap jj <esc>

" Make VIM's ex command history longer than the default 20
set history=300

" Set a $ as a delimiter to whats being changed by the change command
set cpoptions+=$

" Allows virtual editing eg. moving my cursor to spaces that aren't
" characters, etc.
set virtualedit=all

" changes the cursor shape/color
" in the terminal depending on the mode
" see http://code.google.com/p/iterm2/issues/detail?id=710&q=cursor
if &term =~ "xterm\\|rxvt"
  " use a | cursor in insert mode
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"

  " use a rectangle cursor otherwise
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"

  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -e -n "\x1b[\x34 q"
endif

set nofoldenable    " disable folding

autocmd BufWritePre * %s/\s\+$//e

" FZF to ctrl-p
map <C-p> :FZF<CR>

" GitGutter styling to use · instead of +/-
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

" search settings:
" this ignores case unless you input an uppercase character into the search
" bar
set ignorecase
set smartcase

" split behavior
set splitbelow
set splitright

