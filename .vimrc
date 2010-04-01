call pathogen#runtime_append_all_bundles() " load all plugins in the ~/.vim/bundle directory
syntax on                                  " turn on syntax highlighting
let mapleader = ","                        " remap leader to ',' which is much easier than '\'
filetype plugin indent on                  " enable automatic filetype detection, filetype-specific plugins/indentation

" GUI
"-------------------------------------------------
if has("gui_running")
  colorscheme darkspectrum
  "set cursorline                          " highlight current line - DISABLED FOR SPEED
  set guioptions-=T                        " hide tool bar
  set guifont=Bitstream\ Vera\ Sans\ Mono\:h13
  set guicursor=a:blinkon0
end

" INDENTATION
"-------------------------------------------------
set shiftwidth=2                           " number of spaces to use in each autoindent step
set tabstop=2                              " two tab spaces
set softtabstop=2                          " number of spaces to skip or insert when <BS>ing or <Tab>ing
set expandtab                              " spaces instead of tabs for better cross-editor compatibility
set autoindent                             " keep the indent when creating a new line
set smarttab                               " use shiftwidth and softtabstop to insert or delete (on <BS>) blanks
set cindent                                " recommended seting for automatic C-style indentation
set autoindent                             " automatic indentation in non-C files

" MISC
"-------------------------------------------------
set nocompatible                           " don't need to keep compatibility with Vi
set background=dark                        " make vim use colors that look good on a dark background
"set shortmess+=I                           " disable the welcome screen
set hidden                                 " allow hiding buffers with unsaved changes
set listchars=trail:.,tab:>-,eol:$         " change the invisible characters
set nolist                                 " hide invisibles by default
set showcmd                                " show incomplete cmds down the bottom
set showmode                               " show current mode down the bottom
set cmdheight=2                            " make the command line a little taller
set ttyfast                                " more smooth screen redrawing
"set lazyredraw                             " do not redraw window
set incsearch                              " find the next match as we type the search
set hlsearch                               " highlight searches by default
set ruler                                  " show ruler
set number                                 " show line numbers
set vb t_vb=                               " turn off bell
set mouse=a                                " enable the mouse

" WRAP
"-------------------------------------------------
set nowrap                                 " dont wrap lines
"set wrap                                   " wrap entire words, don't break them; much easier to read!
"set linebreak                              " wrap lines at convenient points
set wildmenu                               " make tab completion act more like bash
set wildmode=list:longest                  " tab complete to longest common string, like bash
set switchbuf=useopen                      " don't re-open already opened buffers

" FILETYPES
"-------------------------------------------------
augroup myfiletypes
  " clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,haml,eruby,yaml,ru set ai sw=2 sts=2 et
  "autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
  "autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  "autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
  "autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  highlight Pmenu ctermbg=238 gui=bold
  "au Bufenter *.clj setfiletype clojure
augroup END

" CUSTOM STATUS LINE - see: http://vimdoc.sourceforge.net/htmldoc/options.html#'statusline'
"-------------------------------------------------
set statusline=%F%m%r%h%w\ [TYPE=%Y]\ \ \ \ \ \ \ \ \ \ \ \ [POS=%2l,%2v][%p%%]\ \ \ \ \ \ \ \ \ \ \ \ [LEN=%L]
set laststatus=2

" BACKUPS
"-------------------------------------------------
set backupdir=$HOME/.vim/backup
set directory=$HOME/.vim/backup

" COMMAND-T SETTINGS
"-------------------------------------------------
let g:CommandTMatchWindowAtTop = 0
let g:CommandTMaxHeight = 30

" CUSTOM KEY MAPPINGS
"-------------------------------------------------

" make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

" re-run the last command
nnoremap <Leader>. :<Up><CR>

" make tabs work like we're used to
map <C-Tab> :tabnext<CR>
map <C-S-Tab> :tabprev<CR>

" show nerdtree with line numbers for easier navigation
map <Leader>n :NERDTreeToggle<CR> :set number<CR>

" command-t (fuzzyfinder replacement)
"nmap <silent> <Leader>t :CommandT<CR>

" buffer navigation
map <Leader>, <C-^>
map <Leader>] :bnext<CR>
map <Leader>[ :bprev<CR>
map <Leader>ls :buffers<CR>

" quickly open/source .vimrc/.gvimrc
nmap .s :source $HOME/.vimrc<cr>
nmap .g :source $HOME/.gvimrc<cr>
nmap .v :tabe $HOME/.vimrc
nmap .vp :sp $HOME/.vimrc

" quickly delete all trailing whitespace
nnoremap <silent> <D-d> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" convert one line blocks in braces { } to multiline do ... end & map to <Leader>b
fun! BlockBracesToDoEnd()
  s/{\(.*\)}/do\r\1\rend/
endfun
nmap <Leader>b :call BlockBracesToDoEnd()<CR>

" alternative key for esc
imap jj <Esc>

" toggle show invisibles
:noremap ,i :set list!<CR>

" show the taglists
map <Leader>l :TlistToggle<CR>
let g:Tlist_Ctags_Cmd="/usr/local/bin/ctags"

" easygrep options
"let g:EasyGrepFileAssociations
let g:EasyGrepMode=0                       " 0=all files / 1=open buffers / 2=track the current extension
let g:EasyGrepCommand=1                    " specifies the grep command to use (0=vimgrep / 1=grep)
let g:EasyGrepRecursive=1                  " specifies that recursive search be activated on start (0 / 1)
let g:EasyGrepIgnoreCase=1                 " specifies the case sensitivity of searches (0 / 1)
let g:EasyGrepHidden=0                     " specifies that hidden files search be activated on start (0 / 1)
"let g:EasyGrepAllOptionsInExplorer
"let g:EasyGrepWindow
let g:EasyGrepOpenWindowOnMatch=1
let g:EasyGrepEveryMatch=0
let g:EasyGrepJumpToMatch=0
let g:EasyGrepSearchCurrentBufferDir=0
"let g:EasyGrepInvertWholeWord
"let g:EasyGrepFileAssociationsInExplorer
"let g:EasyGrepReplaceWindowMode
"let g:EasyGrepReplaceAllPerFile
"let g:EasyGrepOptionPrefix
"let g:EasyGrepExtraWarnings
