" Fichier de configuration de Vim
" Ensimag 2009.

"Vundle"
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'scrooloose/nerdtree.git'
"Plugin 'lepture/vim-jinja'
"Plugin 'vim-scripts/taglist.vim.git'
Plugin 'kien/ctrlp.vim.git'
"Plugin 'kchmck/vim-coffee-script'
Plugin 'vim-scripts/mru.vim'
call vundle#end()            " required
filetype plugin indent on    " required

"mac
set backspace=indent,eol,start
"set backspace=2 "activer la touche backspace

set smartindent   " smart code indentation
set smarttab      " smart tabs
" gg=G pour reindenter tout un fichier.

set   nocp
se noshowmatch  "Ne montre pas les ({[ correspondantes, cela m'Ã©nerve
"so nohls        "Ne colorie pas le pattern recherchÃ©, ca me crispe aussi
se sw=4         "Indentation de 4 blancs
set expandtab     "supprime les tabulations et met des espaces
"Indentation automatique type C mise en route lors du chargement du fichier
au BufNewFile,BufRead *.c,*.cc,*.cpp,*.h        se cindent
"Remplace les tab par des blancs en C
au BufNewFile,BufRead *.c,*.cc,*.cpp,*.h      se expandtab
syntax on       "Coloration syntaxique

highlight NoSpaceEOL ctermbg=red ctermfg=white guibg=#592929
match NoSpaceEOL / \+$/
"highlight NoTabs ctermbg=red ctermfg=white guibg=#592929
"match NoTabs /\t/

se visualbell   "Evite les biiiiiips

set background=dark
set number      "Affiche le numero de chaque ligne a gauche
set showcmd     "Affiche la commande en cours
set ignorecase  "Vim ne fasse pas la difference entre les majuscules et les minuscules, activez cette option
set mouse=a     "Activer le support de la souris

set laststatus=2 " Affiche la barre de status quoi qu'il en soit (0 pour la masquer, 1 pour ne l'afficher que si l'ecran est divise)
if has("statusline")
    set statusline=\ %f%m%r\ [%{strlen(&ft)?&ft:'aucun'},%{strlen(&fenc)?&fenc:&enc},%{&fileformat},ts:%{&tabstop}]%=%l,%c%V\ %P
elseif has("cmdline_info")
    set ruler " Affiche la position du curseur en bas a gauche de l'ecran
endif

set autoread "Relire automatiquement fichier modifier par une autre application  

"////////recherche
set  hlsearch    "colore la recherche
set  incsearch "Le curseur se déplace dans les résultats au fur et à mesure de la saisie (comme sous Firefox). 
set  ignorecase "insensible à la casse
set  smartcase "casse si il y a une majuscule

"////////completion
set  wildmenu    "affiche le menu
set  wildmode =list:longest,list:full    "affiche toutes les possibilités
set  wildignore =*.o,*.r,*.so,*.sl,*.tar,*.tgz    "ignorer certains types de fichiers pour la complétion des includes
"//menu deroulant
"set completeopt=menu
"let OmniCpp_selectFirstItem = 2

"///////autofolding
function! MyFoldFunction()
		let line = getline(v:foldstart)
		let sub = substitute(line,'/\*\|\*/\|^\s+', '', 'g')
		let lines = v:foldend - v:foldstart + 1
		return v:folddashes.sub.'...'.lines.' Lines...'.getline(v:foldend)
endfunction
"set   foldmethod  =syntax     "Réduira automatiquement les fonctions et blocs (#region en C# par exemple)
"set  foldtext =MyFoldFunction()    "on utilise notre fonction (optionnel)

"///////correction orthographique
"set   spelllang  =en,fr
"set  spell
"set  spellsuggest =5
"il faut retapper set spelllang=en,fr en mode commande pour que vim télécharge les dictionnaires. 

"set   cursorline "La ligne contenant le curseur sera mise en valeur

"//////cpp
set tags+=~/weedvision/.ctags
set completeopt=menu
let OmniCpp_SelectFirstItem = 2
map <F12> :!ctags --c-types=+p --c++-kinds=+p --fields=+iaS --extra=+q -f ~/weedvision/.ctags -R ~/weedvision/core<CR>
iab   #i #include

"python
let NERDTreeIgnore = ['\.pyc$','\.DS_Store$']

"plugin tlist
let Tlist_Use_Right_Window  = 1

"ctrlp
set wildignore+=*/build/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\build\\*,*.swp,*.zip,*.exe  " Windows

autocmd VimEnter * if !argc() | call Open()| endif

function! Open()
"  exec "TlistOpen"
  exec "NERDTree"
endfunction

function! F_5()
  wa
  exec "!clear; ./vim vim_f5"
endfunction

function! F_6()
  wa
  exec "!clear; ./vim vim_f6"
endfunction

function! F_7()
  wa
  exec "!clear; ./vim vim_f7"
endfunction

function! F_8()
  wa
  exec "!clear; ./vim vim_f8"
endfunction

ca grep grep!
set grepprg=git\ grep\ -n\ $*
func GitGrep(...)
    let s = '!git grep'
    for i in a:000
        let s = s . ' ' . i
    endfor
    exec s
endfun

command -nargs=? Grep call GitGrep(<f-args>)
map <F1> :!sh ~/weedvision/install.sh<CR>
map <F4> :!sh ~/weedvision/updateAll.sh<CR>

map <F5> :call F_5()<CR>
map <F6> :call F_6()<CR>
map <F7> :call F_7()<CR>
map <F8> :call F_8()<CR>

map <C-F5> :call F_5()<CR>
map <C-F6> :call F_6()<CR>
map <c-F7> :!clear<CR> :!~/agribot/build/Agribot<CR>



