execute pathogen#infect()

let mapleader=","

syntax on
set nocompatible          " be iMproved
filetype off              " required!

filetype plugin indent on " required!

" Pour ctrlspace plugin
set hidden

" truc/astuce vim, tips {

"g \cg : position exacte du curseur
" \cg: status du buffer.
" ga code ascii du curseur
" echo char2nr(getline('.')[col('.')-1])
" gv :pour reselectionner la derniere visual
" ctrl+n/p pour la completion
" mode ctrl+x terrible !
" :fold reduire les blocs d'instructions 
" zz me replacer au centre de l'ecran en restant au même endroit dans le text (pas M car il ne deplace pas le text)"{{{"}}}"{{{"}}}
" copie le buffer (issue d'un y) dans la ligne de commande. (Tip #383) \cr" 
" revenir a la derniere modification '.
" inverser les ligne d'une selection (sauf la premiere): :'<,'>g/./m'<
" }

" je cherche a faire: {
"  }

" set guifont=-b&h-lucidatypewriter-medium-r-normal-*-*-140-*-*-m-*-iso8859-15
" set guifont=-*-terminus-medium-*-*-*-16-*-*-*-*-*-*-*
set guifont=PragmataPro\ 12
" set encoding=iso-8859-15

" Pour vim-powerline
" Always show the status bar and not on splited like before(this was the main problem)
set laststatus=2   
" to fix the font and lot of strange characters and colors
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\

" Airline Setup
let g:airline_powerline_fonts=1
set t_Co=256
" let g:airline_theme='powerlineish'
" let g:airline_theme='ubaryd'
let g:airline_theme='badwolf'
" let g:airline_theme='wombat'
" let g:airline_theme='molokai'
" let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tmuxline#enabled = 0

" lightline Setup
" let g:lightline = { 'colorscheme': 'wombat', }

" Vimwiki setup
"----------------------------------
let g:vimwiki_list=[{'path':'~/.vim/vimwiki'}]

" Syntastic Configuration
let g:syntastic_enable_perl_checker = 1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] 


" TagBar
nmap <F7> :TagbarToggle<CR>

set incsearch
" set digraph

autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif


set modelines=0

filetype indent on

if has('gui_running')
    " GUI colors
    colorscheme jellybeans 
else
    " Non-GUI (terminal) colors
    " colorscheme desert 
    colorscheme jellybeans
endif

" colorscheme ron 
" colorscheme wombat
" colorscheme mustang

set hlsearch
noremap <F8> :set hlsearch!<cr>:set hlsearch?<cr>

set autochdir       " to change directories upon opening a file.
set showmatch
set scrolloff=10
" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults (much better!)
set backspace=2		" allow backspacing over everything in insert mode
" Now we set some defaults for the editor 
set autoindent		" always set autoindenting on
set textwidth=0		" Don't wrap words by default
set nobackup		" Don't keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more than
			" 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

set isfname=@,48-57,/,.,-,_,+,,,#,$,%,~
" We know xterm-debian is a color terminal
if &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
  set t_Co=16
  set t_Sf=<ESC>[3%dm
  set t_Sb=<ESC>[4%dm
endif

augroup cprog
  " Remove all cprog autocommands
  au!

  " When starting to edit a file:
  "   For *.c and *.h files set formatting of comments and set C-indenting on.
  "   For other files switch it off.
  "   Don't change the order, it's important that the line with * comes first.
  autocmd BufRead *       set formatoptions=tcql nocindent comments&
  autocmd BufRead *.cpp,*.c,*.h set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
augroup END

if has("autocmd")
" " Also, support editing of gzip-compressed files. DO NOT REMOVE THIS!
" " This is also used when loading the compressed helpfiles.
" augroup gzip
"   " Remove all gzip autocommands
"   au!
" 
"   " Enable editing of gzipped files
"   "	  read:	set binary mode before reading the file
"   "		uncompress text in buffer after reading
"   "	 write:	compress file after writing
"   "	append:	uncompress file, append, compress file
"   autocmd BufReadPre,FileReadPre	*.gz set bin
"   autocmd BufReadPre,FileReadPre	*.gz let ch_save = &ch|set ch=2
"   autocmd BufReadPost,FileReadPost	*.gz '[,']!gunzip
"   autocmd BufReadPost,FileReadPost	*.gz set nobin
"   autocmd BufReadPost,FileReadPost	*.gz let &ch = ch_save|unlet ch_save
"   autocmd BufReadPost,FileReadPost	*.gz execute ":doautocmd BufReadPost " . expand("%:r")
" 
"   autocmd BufWritePost,FileWritePost	*.gz !mv <afile> <afile>:r
"   autocmd BufWritePost,FileWritePost	*.gz !gzip <afile>:r
" 
"   autocmd FileAppendPre			*.gz !gunzip <afile>
"   autocmd FileAppendPre			*.gz !mv <afile>:r <afile>
"   autocmd FileAppendPost		*.gz !mv <afile> <afile>:r
"   autocmd FileAppendPost		*.gz !gzip <afile>:r
" augroup END
" 
" augroup bzip2
"   " Remove all bzip2 autocommands
"   au!
" 
"   " Enable editing of bzipped files
"   "       read: set binary mode before reading the file
"   "             uncompress text in buffer after reading
"   "      write: compress file after writing
"   "     append: uncompress file, append, compress file
"   autocmd BufReadPre,FileReadPre        *.bz2 set bin
"   autocmd BufReadPre,FileReadPre        *.bz2 let ch_save = &ch|set ch=2
"   autocmd BufReadPost,FileReadPost      *.bz2 |'[,']!bunzip2
"   autocmd BufReadPost,FileReadPost      *.bz2 let &ch = ch_save|unlet ch_save
"   autocmd BufReadPost,FileReadPost      *.bz2 execute ":doautocmd BufReadPost " . expand("%:r")
" 
"   autocmd BufWritePost,FileWritePost    *.bz2 !mv <afile> <afile>:r
"   autocmd BufWritePost,FileWritePost    *.bz2 !bzip2 <afile>:r
" 
"   autocmd FileAppendPre                 *.bz2 !bunzip2 <afile>
"   autocmd FileAppendPre                 *.bz2 !mv <afile>:r <afile>
"   autocmd FileAppendPost                *.bz2 !mv <afile> <afile>:r
"   autocmd FileAppendPost                *.bz2 !bzip2 -9 --repetitive-best <afile>:r
" augroup END

endif " has ("autocmd")

" Some Debian-specific things
augroup filetype
  au BufRead reportbug.*		set ft=mail
augroup END

" Activation coloration syntaxique
syntax on

" Fct d'affichage d'affichage en video inverse
function! s:DisplayStatus(msg)
        echohl Todo
            echo a:msg
                echohl None
endfunction

" Perso ligne status
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [Line=%04l]\ [Col=%04v]\ [%p%%]

" Activation de l'indentation auto
set autoindent

" The following are commented out as they cause vim to behave a lot
" different from regular vi. They are Highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
" auto indentation pour la programmation
" permet d'avoir la position
set et
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Fonction de 'nettoyage' d'un fichier
"   - remplacement des tabulations par des expaces
"   - suppression des caracteres ^M en fin de ligne
function! CleanCode()
    %retab
    %s/^M//g
    call s:DisplayStatus('Code nettoye')
endfunction

" Deplacement de l'onglet courant vers la gauche ou vers la droite
function! MoveTab(direction)
    if (a:direction == 'left')
        let tabNum = tabpagenr()-2
    if (tabNum < 0)
        let tabNum = 0
    endif
    execute 'tabm' . tabNum
    else
        let tabNum = tabpagenr()
        execute 'tabm' . tabNum
    endif
endfunction

" Ajout numerotation des lignes
set number
" highlight LineNr ctermbg=black ctermfg=gray
highlight LineNr ctermbg=blue ctermfg=gray
" Ajout d'une ligne coloree pour surligner la ligne en cours
set cursorline
" highlight CursorLine term=reverse cterm=reverse
highlight CursorLine term=underline cterm=underline
" Lingueur Maximale des lignes
set textwidth=80
" Surligne la colonne du dernier caractere autorise par textwidth
set cc=+1

" Amelioration de la lisibilite des noms des onglets
highlight TabLine term=none cterm=none
highlight TabLineSel ctermbg=darkblue

" Autorisation de remonter d'une ligne avec les fleches
" gauche et droite
"set whichwarp=b,s,<,>,[,]

" Ouverture des fichiers avec le curseur a la position de la
" derniere edition
function! s:CursorOldPosition()
    if line("'\"") > 0 && line("'\"") <= line("$")
        exe "normal g`\""
    endif
endfunction
autocmd BufReadPost * silent! call s:CursorOldPosition()

" Mes fichiers sont unix tout le temps
set fileformats=unix
set formatoptions=rtql

" pas de copie de sauvegarde
set nobackup

" syntax keyword moi MichouX
hi moi ctermfg=darkblue guifg=#000099

" permet les couleurs pour la prog
autocmd BufRead *.sh,*.c,*.h,*.pl,mutt*,*.php,*.php3,*.html,*.htm syntax on
syntax on

" pour la prog avec mots clés
autocmd BufRead *.html,*.htm set ft=html
autocmd BufRead *.php,*.php3 set ft=php
autocmd BufRead *.c,*.h set ft=c
autocmd BufRead .followup,.article*,.letter,/tmp/mutt*,*.txt set ft=mail
autocmd BufRead *.sh set ft=sh
autocmd BufRead *.pl set ft=perl

" commente/decommenter auto
autocmd BufEnter *.sh,*.pl,*rc vmap ;com :s/^/# /<CR>
autocmd BufEnter *.sh,*.pl,*rc vmap ;uncom :s/^#[<TAB> ]//<CR>
autocmd BufEnter *.htm,*.html,*.xml,*.wml vmap ;com :<backspace><backspace><backspace><cr>O<!--<esc>:'><cr>o--><esc>
autocmd BufEnter *.html,*.php,*.php3 vmap ;table :<backspace><backspace><backspace><cr>O<table><esc>:'><cr>o</table><esc>
autocmd BufEnter *.html,*.php,*.php3 vmap ;tr <tab>O<tab><tr><esc>:'><cr>o<tab></tr><esc>
autocmd BufEnter *.html,*.php,*.php3 vmap ;td <tab>O<tab><td><esc>:'><cr>o<tab></td><esc>
autocmd BufEnter *.html,*.php,*.php3 vmap ;form <tab>O<tab><form action=\".\" method=get enctype=\"text/plain\"><esc>:'><cr>o<tab></form><esc>
autocmd BufEnter *.php,*.php3 nnoremap gx yiw/^\(sub\<bar>function\)\s\+<C-R>"<CR>
autocmd BufEnter *.vimrc vmap ;com :s/^/" /<CR>
autocmd BufEnter *.vimrc vmap ;uncom :s/^"[<TAB> ]//<CR>
autocmd BufEnter *.php,*.c,*.h,*.cc,*.C,*.H,*.hh,*.cpp,*.cxx,*.c++,*.y,*.l vmap ;com :s/^/\/\/ /g<CR>
autocmd BufEnter *.php,*.c,*.h,*.cc,*.C,*.H,*.hh,*.cpp,*.cxx,*.c++,*.y,*.l vmap ;uncom :s/^\/\/[<TAB> ]//g<CR>
" map!  <ESC>lxi
" nnoremap  x
" nnoremap  hx

set noautoindent

" ajout  accolade
" map!  <ESC>:.,$g/^[ 	]*$/d<CR>i
" nnoremap  :.,$g/^[ 	]*$/d<CR>

autocmd BufEnter *.c,*.h,*.cc,*.C,*.H,*.hh,*.cpp,*.cxx,*.c++,*.y,*.l map!  {<ESC>o}<ESC>O
autocmd BufEnter *.c,*.h,*.cc,*.C,*.H,*.hh,*.cpp,*.cxx,*.c++,*.y,*.l nnoremap  o{<ESC>o}<ESC>O

"delete
"map! <ESC>[3~ <ESC>lxi
" nnoremap <ESC>[3~ x

" backspace     
" map! <S- > <M- >
map!  <backspace>
" nnoremap  hx
" map! <ESC>Oq 1
" map! <ESC>Or 2
" map! <ESC>Os 3
" map! <ESC>Ot 4
" map! <ESC>Ou 5
" map! <ESC>Ov 6
" map! <ESC>Ow 7
" map! <ESC>Ox 8
" map! <ESC>Oy 9
" map! <ESC>OQ /
" map! <ESC>OR *
" map! <ESC>OS -
" map! <ESC>Ol +
" map! <ESC>OM <CR>
" map! <ESC>On .
" map! <ESC>Op 0
nnoremap [2~ 0
nnoremap [4~ $
map! [2~ <esc>I
map! [4~ <esc>A

"tabulation
nnoremap <TAB> >>
" nnoremap <ESC>[Z <<
vnoremap <TAB> >
" vnoremap <ESC>[Z <
" vnoremap <SHIFT><TAB> <
inoremap  <esc>O
inoremap  <esc>o

" Editer le .vimrc 
nnoremap ;v :split ~/.vimrc " <CR>:source ~/.vimrc<CR>
" Reload le .vimrc sans quitter vim
" autocmd BufLeave .vimrc :source ~/.vimrc<CR>
" autocmd BufWritePost ~/.vimrc :source ~/.vimrc

" pour le c
autocmd BufEnter *.c,*.h,*.cc,*.C,*.H,*.hh,*.cpp,*.cxx,*.c++,*.y,*.l inoreab def <ESC>:0<CR>O#define
autocmd BufEnter *.c,*.h,*.cc,*.C,*.H,*.hh,*.cpp,*.cxx,*.c++,*.y,*.l inoreab de <ESC>:0<CR>/#define<CR>O#define
autocmd BufEnter *.c,*.h,*.cc,*.C,*.H,*.hh,*.cpp,*.cxx,*.c++,*.y,*.l inoreab inc <ESC>:0<CR>O#include
autocmd BufEnter *.c,*.h,*.cc,*.C,*.H,*.hh,*.cpp,*.cxx,*.c++,*.y,*.l inoreab in <ESC>:0<CR>/#include<CR>O#include
autocmd BufEnter *.c,*.h,*.cc,*.C,*.H,*.hh,*.cpp,*.cxx,*.c++,*.y,*.l inoreab For for()<CR>	{<CR>	<ESC>o	}<ESC>3k03li
autocmd BufEnter *.c,*.h,*.cc,*.C,*.H,*.hh,*.cpp,*.cxx,*.c++,*.y,*.l inoreab While while()<CR>	{<CR>	<ESC>o	}<ESC>3k$i
" autocmd BufEnter *.c,*.h,*.cc,*.C,*.H,*.hh,*.cpp,*.cxx,*.c++,*.y,*.l set noautoindent

"marche pas sur deb apparement...
" highlight Search      term=reverse ctermbg=2 guibg=Yellow

" set foldmethod=marker
set foldcolumn=4
" set foldmarker={,}
" set foldminlines=5
highlight Folded ctermbg=0 ctermfg=7

" mails
"permet de faire des lignes de 60 caracteres
autocmd BufRead .followup,.article*,.letter,/tmp/mutt*,*.txt,.signature*,signature* set tw=60
autocmd BufRead .followup,.article*,.letter,/tmp/mutt*,*.txt,.signature*,signature* set foldmethod=manual
autocmd BufRead .followup,.article*,.letter,/tmp/mutt*,*.txt,.signature*,signature* set comments+=n:\|
" autocmd BufRead .followup,.article*,.letter,/tmp/mutt*,*.txt,.signature*,signature* set comments=fs1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-,n:\|

" pour insert le followup automatiquement.
nnoremap ;fu /Newsgroups<CR>wlDp/Followup-To:<CR>/: <CR>plD
"pour aller au debut du message
nnoremap ;vide gg<CR>/^$<CR>
" nnoremap ;par ;vide<CR>:.,$normal vgq<CR>
" nnoremap ;par :exec '.,$g/^.\{'.&tw.'\}.\+$/normal V)gq'<CR>
" /^.\{75\}.\+$<CR>v/\.$<CR>gqj

 function! s:Par()
	let fin_range_delta=line('$')-search('^-- $','W')
	echo "range delta de fin : " . fin_range_delta
" je commence a la premiere ligne vide (après les headers)
	normal! G
	let pos = search('^$')
	let oldpos = pos
	echo "definition de pos:" . pos
" je vais a la fin puis remonte au dessus de la signature.
	let pos = search('^.\{'.&tw.'\}.\+$', 'W') 
" je me place au debut de ce que je dois traiter.
    while ( pos < line('$')-fin_range_delta ) && ( oldpos < pos )
 		if pos < 1
 			break 
 		endif
" detection de la fin du paragraphe.
		let end = pos
		let end = search('\(^\(> \)*\|[:;=][-o]\?[pD{[(/\\}\])]\|[:.!?]\)\s*$', 'W')
		let delta = end - pos
echo "mise en page de " . pos . " sur " . delta ." lignes."
		if delta <= 0
			exe pos.'normal! gqq'
		else
			exe pos.'normal! gq'.delta.'j'
		endif
 		let oldpos = pos
		let pos = search('^.\{'.&tw.'\}.\+$', 'W') 
     endwhile
 endfunction
 
autocmd BufRead .followup,.article*,.letter,/tmp/mutt* nnoremap ;para gg:call <sid>Par()<cr>

nnoremap ;é :silent! %s/…/é/g<CR>
nnoremap ;' :silent! %s/’/'/g<CR>
nnoremap ;oe :silent! %s/œ/oe/g<CR>
nnoremap ;MM :silent! %s/\r//g<CR>gg
autocmd BufRead .followup,.article*,.letter,/tmp/mutt* nnoremap ;redu  :silent! %s/\(^[> ]\+\)\(\n^[> ]\+$\)\+/\1/<CR>
autocmd BufRead .followup,.article*,.letter,/tmp/mutt* nnoremap ;rmsig G:silent! /^>[> ]*-- $<CR>:.,$g/^>[> ]*/d<CR>
autocmd BufRead .followup,.article*,.letter,/tmp/mutt* nnoremap ;rmyahoo G:silent! /^>[> ]*=====$<CR>:.,$g/^>[> ]*/d<CR>
" pour elever le reste des quotes
autocmd BufRead .followup,.article*,.letter,/tmp/mutt* nnoremap <C-S> :.,$g/^>[ >]\?/d<CR>i
"pour aller a la prochaine quote vide.
" autocmd BufRead .followup,.article*,.letter,/tmp/mutt* map! <C-S> <ESC>md/^\(>[ >]\+\\|\)$<CR>C
autocmd BufRead .followup,.article*,.letter,/tmp/mutt* map! <C-S> <ESC>j/^\(>[ >]\+\\|\)$<CR>C
autocmd BufRead .followup,.article*,.letter,/tmp/mutt* map! <C-T> <esc>g`da

vnoremap <buffer> ;snip dO> [snip]<Esc>
vnoremap <buffer> ;... dO> [...]<Esc>

" signatures.
" efface la signature courante
autocmd BufRead .followup,.article*,.letter,/tmp/mutt* nnoremap ;sig  mS/^-- $<CR>V}c-- <esc>:r!~/bin/signature.pl<CR>`S
autocmd BufRead .followup,.article*,.letter,/tmp/mutt* nnoremap ;cord mS/^-- $<CR>V}c-- <CR>Cordialement,<CR>    Michael CHLON<ESC>`Sl
autocmd BufRead .followup,.article*,.letter,/tmp/mutt* nnoremap ;talc mS/^-- $<CR>V}c-- <ESC>:r ~/.signature.cord<CR>`Sl
autocmd BufRead .followup,.article*,.letter,/tmp/mutt* nnoremap ;rega mS/^-- $<CR>V}c-- <CR>Regards,<CR>    Michael Chlon<ESC>`Sl
autocmd BufRead .followup,.article*,.letter,/tmp/mutt* nnoremap ;salu mS/^-- $<CR>V}c-- <CR>Dans l'attente d'une réponse je vous prie d'agréer mes salutations distinguées,<CR>    Michael Chlon<ESC>`Sl
autocmd BufRead .followup,.article*,.letter,/tmp/mutt* inoremap ;sig	<esc>;sig
autocmd BufRead .followup,.article*,.letter,/tmp/mutt* noremap! ;rega	<esc>;rega
autocmd BufRead .followup,.article*,.letter,/tmp/mutt* noremap! ;salu	<esc>;salu
autocmd BufRead .followup,.article*,.letter,/tmp/mutt* noremap! ;cord	<esc>;cord
autocmd BufRead .followup,.article*,.letter,/tmp/mutt* noremap! ;talc	<esc>;talc
autocmd BufRead .followup,.article*,.letter,/tmp/mutt* nnoremap ;cv :normal i;cv<cr>
autocmd BufRead .followup,.article*,.letter,/tmp/mutt* nnoremap ;was gg/^Subject<CR>2wi[was: <ESC><END>a ]<ESC>0wli 
autocmd BufRead .followup,.article*,.letter,/tmp/mutt* nnoremap ;tip gg/^Subject<CR>2wi[tip] <ESC>:normal ;vide<CR>
autocmd BufRead .followup,.article*,.letter,/tmp/mutt* noremap! ;cv Vous trouverez mon CV au format html attaché à ce mail ainsi que sur mon site web: http://michoux.born2frag.org/CV/

autocmd BufRead .followup,.article* normal ;fu
" passer directement au message
autocmd BufRead .followup,.article*,.letter,/tmp/mutt* normal ;MM
autocmd BufRead .followup,.article*,.letter,/tmp/mutt* normal ;para
autocmd BufRead .followup,.article*,.letter,/tmp/mutt* normal ;redu
autocmd BufRead .followup,.article*,.letter,/tmp/mutt* normal ;rmsig
autocmd BufRead .followup,.article*,.letter,/tmp/mutt* normal ;rmyahoo
autocmd BufRead .followup,.article*,.letter,/tmp/mutt* normal ;'
autocmd BufRead .followup,.article*,.letter,/tmp/mutt* normal ;é
autocmd BufRead .followup,.article*,.letter,/tmp/mutt* normal ;vide


inoreab bientot bientôt
inoreab arrete arrête
inoreab dasn dans
inoreab dsna dans
inoreab dnas dans
inoreab ;à ;p
inoreab ca ça
inoreab Ca Ça
inoreab apres après
inoreab aprés après
inoreab tres très
inoreab etre être
inoreab Etre Être
inoreab meme même
inoreab deja déjà
inoreab decu deçu
inoreab recu reçu
inoreab etait était
inoreab etais étais
inoreab ecris écris
inoreab paris Paris
inoreab Sebastien Sébastien
inoreab tlse Toulouse
inoreab toulouse Toulouse
inoreab facon façon
inoreab fete fête
inoreab helene Hélène
inoreab ;H häagen-dazs
inoreab urlfamille http://famille:XXXXX@nospam.born2frag.org/famille/
inoreab urlparis http://b2f:XXXXX@nospam.born2frag.org/paris/
inoreab urlft http://ft:XXXXX@nospam.born2frag.org/foyerft/


" Fabien Penso - Pour copier/coller du texte dans deux sessions vim
nnoremap    _Y      :.w! ~/.vi_tmp<CR>
vnoremap    _Y      :w! ~/.vi_tmp<CR>
nnoremap    _P      :r ~/.vi_tmp<CR>
nnoremap     <C-Z>   :shell<CR>
nnoremap     [c   :bn<cr>
nnoremap     [d   :bp<cr>
nnoremap     [a   :ls<cr>
inoremap     [c   <esc>:bn<cr>
inoremap     [d   <esc>:bp<cr>
inoremap     [a   <esc>:ls<cr>
"nnoremap     <C-N>   :bn<cr>
"nnoremap     <C-P>   :bp<cr>
"inoremap     <C-N>   <esc>:bn<cr>
"inoremap     <C-P>   <esc>:bp<cr>
"inoremap     <C-L>   <esc>:ls<cr>


" nnoremap     <C-O>   T vt y:split <C-R>"<CR>

" pour mon signature.pl
autocmd BufRead signature*	nnoremap	;ins /^}$<CR>zvO}elsif ($num==$REF++)<CR>{<CR>print "$SIG <CR>\"<CR>\"<CR>";<ESC>kka
autocmd BufRead blog 		nnoremap	;ins :0<cr>Oµ<cr>µ<cr>MichouXµ<esc>:r!date +\%e/\%m/\%Y<cr>Aµ<cr><esc>:0<cr>i
autocmd BufRead blog 		nnoremap	;up o<b><u>UPDATE&nbsp;:</u></b><br/><esc>F<i


" highlight Normal	ctermfg=white ctermbg=black
highlight Folded	ctermfg=blue ctermbg=black
highlight Search term=reverse ctermbg=blue ctermfg=White guibg=blue guifg=White
highlight Visual term=reverse ctermbg=blue gui=reverse guifg=Grey guibg=fg
highlight WildMenu term=standout ctermbg=Black ctermfg=blue guibg=Yellow guifg=blue
set dictionary=~/.vim/dictionary

" set foldmethod=syntax

" Activation/DÃ©sactivation de la enetre d'exploration de fichier
" map <F9> <Esc>:NERDTreeToggle<CR>
" map <F9> <Esc>:NERDTreeToggle<CR>
map <F9> <plug>NERDTreeTabsToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif



" Affichage de la liste des tags du fichier courant
" map <F8> <Esc>:TlistToggle<CR>
" Verification orthographique
" :set spell
" :set spelllang=fr,en
" :set spellsuggest=10

" Pour finir d'activer latex-suite
filetype plugin on
set grepprg=grep\ -nH\ $*
filetype indent on
let g:tex_flavor='latex'

" Customization du plugin winmanager
let g:winManagerWidth=50
map <c-w><c-t> :WMToggle<cr>
map <c-w><c-f> :FirstExplorerWindow<cr>
map <c-w><c-b> :BottomExplorerWindow<cr>

" Pour colorisation des fichier de trace de xdebug
augroup filetypedetect
au  BufNewFile,BufRead *.xt setf xt
augroup END

map <F5> ]czz
map <F6> [czz

map <F3> :tabprevious<CR>
map <F4> :tabnext<CR>

" Ajout utilisation uft8
if has("multi_byte")
    set encoding=utf-8
    setglobal fileencoding=utf-8
"    set bomb
"   set termencoding=iso-8859-15
    set termencoding=utf-8
    set fileencodings=ucs-bom,iso-8859-15,iso-8859-3,utf-8
else
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif

" Ajout pour MiniBufferExplorer
map <c-b>b :MiniBufExplorer<cr>
map <c-b>c :CMiniBufExplorer<cr>
map <c-b>u :UMiniBufExplorer<cr>
map <c-b>t :TMiniBufExplorer<cr>
let g:miniBufExplMinSize = 2

" WinManager
:map <c-w><c-t> :WMToggle<cr>
:map <c-w><c-b> :BottomExplorerWindow<cr>
: map <c-w><c-f> :FirstExplorerWindow<cr>

" Changer la couleur du coursor
if &term =~ "xterm\\|rxvt"
    " use an orange cursor in insert mode
    let &t_SI = "\<Esc>]12;orange\x7"
    " use a red cursor otherwise
    let &t_EI = "\<Esc>]12;red\x7"
    silent !echo -ne "\033]12;red\007"
    " reset cursor when vim exits
    autocmd VimLeave * silent !echo -ne "\033]112\007"
    " use \003]12;gray\007 for gnome-terminal
endif

" typescript-vim plugin - syntax highlight -
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" tsuqiyomi plugin - Completion - 
autocmd FileType typescript setlocal completeopt+=menu,preview
let g:tsuquyomi_completion_detail = 1

" Unite Plugin
nnoremap <space>u :Unite file_rec/async<CR>
nnoremap <space>/ :Unite grep:.<cr>
nnoremap <space>s :Unite -quick-match buffer<cr>


" ctrl-p plugin
" set runtimepath^=~/.vim/bundle/ctrlp.vim
" CtrlP Plugin
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'


" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

" tagbar Plugin
nmap <F8> :TagbarToggle<CR>

" Vim-JavaScript
let g:javascript_plugin_jsdoc = 1

" Prompt for a command to run
let g:VimuxHeight = "40"
let VimuxUseNearest = 1
map vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map vl :VimuxRunLastCommand<CR>
" Inspect runner pane
map vi :VimuxInspectRunner<CR>
" Zoom the tmux runner pane
map vz :VimuxZoomRunner<CR>

" OmniCompletion
set omnifunc=syntaxcomplete#Complete

"FZF plugin
nnoremap <space>f :FZF<cr>
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
\ 'header':  ['fg', 'Comment'] }


" ctrlspace plugin
let g:CtrlSpaceGlobCommand = 'ag -l --hidden --nocolor -g ""'


" fzf fuzzy completion
set rtp+=/usr/local/opt/fzf

