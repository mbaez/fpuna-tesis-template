%% Template basado en ucathesis.cls (link?) de la Universidad Católica de Asunción, 
%% modificado para adaptarlo al formato de la Facultad Politecnica de la 
%% Universidad Nacional de Asunción

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{fpunathesis}[2014/08/25 v0.02 Formato para tesis de la FPUNA]

\newif\if@isdraft
\newif\if@atstyle
\newcommand{\@logosource}{logocolor.eps}
\usepackage[utf8]{inputenc}
\usepackage[pdftex]{graphicx}
\usepackage{algorithm}
\usepackage{algorithmic}

\bibliographystyle{unsrt} % Numeros ordenados por entrada

\DeclareOption{draft}{ \@isdrafttrue  \PassOptionsToClass{draft}{report} }
\DeclareOption{final}{ \@isdraftfalse \PassOptionsToClass{final}{report} }
\DeclareOption{openright}{ \PassOptionsToClass{openright}{report} }
\DeclareOption{openany}{ \PassOptionsToClass{openany}{report} }
\DeclareOption{twoside}{ \PassOptionsToClass{twoside}{report} }
\DeclareOption{oneside}{ \PassOptionsToClass{oneside}{report} }
\DeclareOption{fleqn}{ \PassOptionsToClass{fleqn}{report} }
\DeclareOption{leqno}{ \PassOptionsToClass{leqno}{report} }
\DeclareOption{openbib}{ \PassOptionsToClass{openbib}{report} }
\DeclareOption{black}{\gdef\@logosource{logoblack}}
\DeclareOption{color}{\gdef\@logosource{logocolor}}
\DeclareOption{gray}{\gdef\@logosource{logogray}}
\DeclareOption{atstyle}{\@atstyletrue}
\DeclareOption{fmstyle}{\@atstylefalse}

\ExecuteOptions{final,oneside,openright,fmstyle,black}
\ProcessOptions
\LoadClass[a4paper,onecolumn,openright,12pt]{report}[1996/10/31]

% load babel using spanish %
\RequirePackage[spanish,activeacute]{babel}

%% load graphicx %
%%\RequirePackage{ifpdf}
%%\ifpdf
%%  \RequirePackage[pdftex]{graphicx}
%%  \pdfcompresslevel=9
%%  \DeclareGraphicsExtensions{.pdf,.png}
%%\else
%%  \RequirePackage[dvips]{graphicx}
%%  \DeclareGraphicsExtensions{.eps,.ps}
%%\fi

% class fields %
\renewcommand{\@author}{\ClassError{fpunathesis}{Falta especificar \string\author{}}
 {Usa el comando \string\author{} en el preambulo para especificar tu nombre.}}
\renewcommand{\author}[1]{\gdef\@author{#1}}

\renewcommand{\@title}{\ClassError{fpunathesis}{Falta especificar \string\title{}}
 {Usa el comando \string\title{} en el preambulo para especificar \MessageBreak
  el titulo de tu tesis.}}
\renewcommand{\title}[1]{\gdef\@title{#1}}

\newcommand{\@degree}{\ClassError{fpunathesis}{Falta especificar \string\degree{}}
 {Usa el comando \string\degree{} en el preambulo para especificar la carrera \MessageBreak
  que estas estudiandio: \protect Matemáticas, Física, Actuaria.}}
\newcommand{\degree}[1]{\gdef\@degree{#1}}

\newcommand{\@advisorname}{}
\newcommand{\@advisortitle}{}
\newcommand{\@advisor}{\ClassError{fpunathesis}{Falta especificar \string\advisor{}{}}
 {Usa el comando \string\advisor[]{}{} en el preambulo para especificar a tu \MessageBreak
  director de tesis. El primer argumento es su titulo (Dr., M. en C.) \MessageBreak
  y el segundo su nombre completo. Opcionalmente puedes modificar su puesto \MessageBreak
  en el jurado si es distinto a 'Vocal y Director'.}}
\newcommand{\advisor}[3][Orientador:]%
  {\gdef\@advisorname{#1}\gdef\@advisortitle{#2}\gdef\@advisor{#3}}


\newcommand{\@institution}{Universidad Nacional de Asunción}
\newcommand{\institution}[1]{\gdef\@institution{#1}}
\newcommand{\@faculty}{Facultad Politécnica}
\newcommand{\faculty}[1]{\gdef\@faculty{#1}}
\newcommand{\@grade}{Ingeniero}
\newcommand{\grade}[1]{\gdef\@grade{#1}}
\newcommand{\@address}{San Lorenzo - Paraguay}
\newcommand{\address}[1]{\gdef\@address{#1}}
\newcommand{\@termyear}{\thisterm}
\newcommand{\termyear}[1]{\gdef\@termyear{#1}}
\newcommand{\@monthyear}{\thismonth}
\newcommand{\monthyear}[1]{\gdef\@monthyear{#1}}
\renewcommand{\@date}{\longdate}
\renewcommand{\date}[1]{\gdef\@date{#1}}

\newcommand{\logosource}[1]{\gdef\@logosource{#1}}

% default date/time strings %
\newcommand{\monthname}{\ifcase\month\or Enero\or Febrero\or
      Marzo\or Abril\or Mayo\or Junio\or Julio\or Agosto\or Septiembre\or
      Octubre\or Noviembre\or Diciembre\fi}
\newcommand{\termname}{\ifcase\month\or Primavera\or Primavera\or
      Primavera\or Primavera\or Primavera\or Verano\or Verano\or Otoño\or Otoño\or
      Otoño\or Otoño\or Otoño\fi}

\newcount\hours \newcount\minutes
\def\SetTime{\hours=\time
        \global\divide\hours by 60
        \minutes=\hours
        \multiply\minutes by 60
        \advance\minutes by-\time
        \global\multiply\minutes by-1 }
\SetTime

\newcommand{\thisterm}{\termname\ de \the\year}
\newcommand{\thismonth}{\monthname\ de \the\year}
\newcommand{\longdate}{\@arabic\day\ de \monthname\ de \the\year}
\newcommand{\shortdate}{\@arabic\day/\@arabic\month/\@arabic\year}
\newcommand{\shorttime}{\number\hours:\ifnum\minutes<10 0\fi\number\minutes}

\newcommand{\draftmodeleyend}{(TESIS COMPILADA EN MODO DRAFT)}
\newcommand{\draftleyend}{BORRADOR \shorttime{} - \shortdate{}}
\newcommand{\blankpageleyend}{(esta página se dejó en blanco de manera intencional)}

% double & singlespacing %
\def\setspace@size{\ifx\@currsize\normalsize\@normalsize\else\@currsize\fi}
\def\doublespacing{\def\baselinestretch{1.660} \setspace@size}
\def\singlespacing{\def\baselinestretch{1} \setspace@size}

\newenvironment{singlespace}{\vskip\baselineskip\singlespacing\vskip-\baselineskip}{\par}
\newenvironment{doublespace}{\vskip\baselineskip\doublespacing\vskip-\baselineskip}{\par}

% floats & footnotes singlespaced %
\let\latexx@xfloat=\@xfloat
\def\@xfloat #1[#2]{\latexx@xfloat #1[#2]
  \def\baselinestretch{1}\@normalsize\normalsize}
\long\def\@footnotetext#1{
  \insert\footins{
    \def\baselinestretch{1}
    \reset@font\footnotesize
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth \@parboxrestore
    \protected@edef\@currentlabel{
      \csname p@footnote\endcsname\@thefnmark}
    \color@begingroup \@makefntext{
        \rule\z@\footnotesep\ignorespaces#1\@finalstrut\strutbox}
    \color@endgroup}}
\long\def\@mpfootnotetext#1{
  \global\setbox\@mpfootins\vbox{
    \unvbox \@mpfootins
    \def\baselinestretch {1}
    \reset@font\footnotesize
    \hsize\columnwidth \@parboxrestore
    \protected@edef\@currentlabel{
      \csname p@mpfootnote\endcsname\@thefnmark}
    \color@begingroup \@makefntext{
       \rule\z@\footnotesep\ignorespaces#1\@finalstrut\strutbox}
   \color@endgroup}}

\newcommand*{\@normalsize}{\normalsize}
\doublespacing

% page numbering %
\pagenumbering{roman}
\newcommand{\frontmatter}{\cleardoublepage\pagenumbering{roman}}
\newcommand{\mainmatter}{\cleardoublepage\pagenumbering{arabic}}

% page margins %
\if@twoside
  \setlength{\oddsidemargin}{35mm}
  \addtolength{\oddsidemargin}{-1in}
  \setlength{\evensidemargin}{25mm}
  \addtolength{\evensidemargin}{-1in}
  \setlength{\textwidth}{\paperwidth}
  \addtolength{\textwidth}{-60mm}
\else
  \setlength{\oddsidemargin}{35mm}
  \addtolength{\oddsidemargin}{-1in}
  \setlength{\evensidemargin}{35mm}
  \addtolength{\evensidemargin}{-1in}
  \setlength{\textwidth}{\paperwidth}
  \addtolength{\textwidth}{-60mm}
\fi

\setlength{\topmargin}{20mm}
\addtolength{\topmargin}{-1in}

\setlength{\textheight}{\paperheight}
\addtolength{\textheight}{-\headheight}
\addtolength{\textheight}{-\headsep}
\addtolength{\textheight}{-\footskip}
\addtolength{\textheight}{-40mm}

% support for \and in author%
\newcounter{@count}
\newcounter{@index}

\def\@undefineand{
 \def\and{
   \ClassError{fpunathesis}{Illegal use of \string\and}%
     {Do not use the \string\and\space command outside the author field}
 }
}

\@undefineand

\newcommand{\@typeauthor}[2]{
 \def\and{\stepcounter{@index}\relax
          \ifnum\value{@index}=\value{@count}%
             #2
          \else
             #1
          \fi}%
 \setbox0=\vbox{\setcounter{@count}{1}\def\and{\stepcounter{@count}}\@author}
 \setcounter{@index}{1}\@author\@undefineand
}

% titlepage
\newlength{\@line}
\setlength{\@line}{12pt}

\renewcommand\maketitle{
  \begingroup\doublespacing % always typeset title pages in doublespacing %
  \begin{titlepage}%
  \begin{center}
    \vspace{1.5\@line}\textbf{\large\MakeUppercase{\@institution}}\par
    \vspace{\@line}\textbf{\large\@faculty}\par
    \vspace{2\@line}\includegraphics{\@logosource}\par
    \vspace{0.5\@line}\textsc{\Large``\@title''}\par
    \vspace{0.5\@line}
    \begin{singlespace}
      \textsc{Trabajo Final de Grado presentado por}\par
      \vfill{\scshape \@typeauthor{\unskip,\par}{\unskip\par y{} }}\par
      \vfill\textsc{como requisito}\par
      \textsc{para obtener el título de \@grade}\par
      \textsc{en \@degree}\par
      \vfill\textsc{\@advisorname}\par\vspace{4pt}
      \textsc{\@advisortitle\ \@advisor}\par\vspace{4pt}
    \end{singlespace}
    \vfill\textrm{\@address. \hfill \@monthyear}
  \end{center}
  \end{titlepage}%
  \endgroup
}

\newenvironment{dedicatoria}{
  \begin{titlepage}
  \begin{flushleft}
    \vspace*{0.5\textheight}
    \hspace*{0.45\textwidth}
    \begin{minipage}{0.5\textwidth}
      \begin{flushleft}
      \begin{doublespace}
}{%
      \end{doublespace}
      \end{flushleft}
    \end{minipage}
  \end{flushleft}
  \end{titlepage}
}

\newenvironment{thankspage}
  {\pagestyle{empty}\chapter*{Agradecimientos}\thispagestyle{empty}}
  {\cleardoublepage\pagestyle{plain}\setcounter{page}\@ne}

% chapter headings
\if@atstyle
  \def\@makechapterhead#1{%
    \begin{center}\doublespacing
    \parindent \z@ \normalfont
      \ifnum \c@secnumdepth >\m@ne
        \Large \scshape \@chapapp\space \thechapter
        \par\nobreak
      \fi
      \interlinepenalty\@M
      \Large \scshape #1\par\nobreak
    \end{center}
  }
  \def\@makeschapterhead#1{%
    \begin{center}\doublespacing
      \parindent \z@
      \normalfont
      \interlinepenalty\@M
      \Large \scshape #1\par\nobreak
    \end{center}
  }
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                     {-3.5ex \@plus -1ex \@minus -.2ex}%
                                     {2.3ex \@plus.2ex}%
                                     {\normalfont\large\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                       {-3.25ex\@plus -1ex \@minus -.2ex}%
                                       {1.5ex \@plus .2ex}%
                                       {\normalfont\normalsize\bfseries}}
\else
  \def\@makechapterhead#1{%
    \vspace*{50\p@}%
    \begin{singlespace}
      \parindent \z@ \raggedright \normalfont
      \ifnum \c@secnumdepth >\m@ne
        \huge\bfseries \@chapapp\space \thechapter
        \par\nobreak
        \vskip 20\p@
      \fi
      \interlinepenalty\@M
      \Huge \bfseries #1\par\nobreak
      \vskip 40\p@
    \end{singlespace}
  }
  \def\@makeschapterhead#1{%
    \vspace*{50\p@}%
    \begin{singlespace}
      \parindent \z@ \raggedright
      \normalfont
      \interlinepenalty\@M
      \Huge \bfseries  #1\par\nobreak
      \vskip 40\p@
    \end{singlespace}
  }
\fi

\renewcommand{\part}{\ClassError{fpunathesis}{Invalid command \string\part}%
  {The \string\part\space command is not available in fpunathesis class}}

% page styles
\def\ps@empty{%
  \def\@oddfoot{\if@isdraft\draftmodeleyend\hfill\draftleyend\fi}
  \def\@evenfoot{\if@isdraft\draftmodeleyend\hfill\draftleyend\fi}
  \def\@oddhead{\if@isdraft\hfill\draftmodeleyend\hfill\fi}
  \def\@evenhead{\if@isdraft\hfill\draftmodeleyend\hfill\fi}
}

\def\ps@blankpage{%
  \def\@oddfoot{\if@isdraft\hfill\blankpageleyend\hfill\fi}
  \def\@evenfoot{\if@isdraft\hfill\blankpageleyend\hfill\fi}
  \def\@oddhead{\if@isdraft\hfill\draftmodeleyend\hfill\fi}
  \def\@evenhead{\if@isdraft\hfill\draftmodeleyend\hfill\fi}
}

\def\ps@plain{%
  \def\@oddfoot{\hfill\thepage\hfill}
  \def\@evenfoot{\hfill\thepage\hfill}
  \def\@oddhead{\if@isdraft\hfill\draftmodeleyend\hfill\fi}
  \def\@evenhead{\if@isdraft\hfill\draftmodeleyend\hfill\fi}
}

\if@twoside
    \def\ps@headings{%
        \def\@oddfoot{\if@isdraft\draftmodeleyend\hfill\draftleyend\fi}
        \def\@evenfoot{\if@isdraft\draftmodeleyend\hfill\draftleyend\fi}
        \def\@evenhead{\thepage\hfil\slshape\leftmark}%
        \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
        \let\@mkboth\markboth
      \def\chaptermark##1{%
        \markboth {\MakeUppercase{%
          \ifnum \c@secnumdepth >\m@ne
              \@chapapp\ \thechapter. \ %
          \fi
          ##1}}{}}%
      \def\sectionmark##1{%
        \markright {\MakeUppercase{%
          \ifnum \c@secnumdepth >\z@
            \thesection. \ %
          \fi
          ##1}}}}
\else
    \def\ps@headings{%
      \def\@oddfoot{\if@isdraft\draftmodeleyend\hfill\draftleyend\fi}
      \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
      \let\@mkboth\markboth
      \def\chaptermark##1{%
        \markright {\MakeUppercase{%
          \ifnum \c@secnumdepth >\m@ne
              \@chapapp\ \thechapter. \ %
          \fi
          ##1}}}}
\fi

\let\@oldcleardoublepage=\cleardoublepage
\renewcommand\cleardoublepage{
  \clearpage
  \thispagestyle{blankpage}
  \if@openright
    \@oldcleardoublepage
  \else
    \clearpage
  \fi
}

\pagestyle{headings}

% title page environment %
\renewenvironment{titlepage}{%
      \newpage
      \thispagestyle{empty}%
      \setcounter{page}\@ne
    }%
    { \cleardoublepage
      \setcounter{page}\@ne
    }

% VERSE, QUOTATION, and QUOTE must be single-spaced. %
\let\@oldverse=\verse
\let\@oldquotation=\quotation
\let\@oldquote=\quote
\let\end@oldverse=\endverse
\let\end@oldquotation=\endquotation
\let\end@olquote=\endquote

\renewenvironment*{verse}{\begin{@oldverse}\begin{singlespace}}
    {\end{singlespace}\end{@oldverse}}

\renewenvironment*{quotation}{\begin{@oldquotation} \begin{singlespace}}
    {\end{singlespace}\end{@oldquotation}}

\renewenvironment*{quote}{\begin{@oldquote} \begin{singlespace}}
    {\end{singlespace} \end{@oldquote}}

\let\@oldthebibliography=\thebibliography
\let\end@oldthebibliography=\endthebibliography

\let\@oldlistoffigures=\listoffigures
\let\@oldlistoftables=\listoftables
\let\@oldlistofalgorithms=\listofalgorithms

\renewcommand{\listoffigures}{\@oldlistoffigures\addcontentsline{toc}{chapter}{\'Indice de Figuras}}
\renewcommand{\listoftables}{\@oldlistoftables\addcontentsline{toc}{chapter}{\'Indice de Tablas}}
\renewcommand{\listofalgorithms}{\@oldlistofalgorithms\addcontentsline{toc}{chapter}{\'Indice de Algoritmos}}

\renewenvironment{thebibliography}[1]{%
  \begin{@oldthebibliography}{#1}%
  \addcontentsline{toc}{chapter}{\protect\numberline{}\bibname}%
}{\end{@oldthebibliography}}

% some corrections of spanish leyends given by babel %
\AtBeginDocument{
  \renewcommand{\contentsname}{\'Indice General}
  \renewcommand\listtablename{\'Indice de Tablas}
  \renewcommand\listfigurename{\'Indice de Figuras}
  \renewcommand{\listalgorithmname}{\'Indice de Algoritmos}
  \renewcommand\tablename{Tabla}
  \floatname{algorithm}{Algoritmo}
  \if@isdraft\setlength\overfullrule{5pt}\fi
}

\endinput
%%
%% End of file `fpunathesis.cls'.
