%% This is a LaTeX class file for generating resumes.
%%
%% Using this style file, a resume has two columns.  The left 
%% column is for broad categories while the right column is for details.
%%
%% Commands:
%%
%%  \line
%%    draws a horizontal line across the page
%%
%%  \leftcolwidth{a}
%%    sets the width of the left column to 'a'
%%    example: \leftcolwidth{1.2in}
%%
%%  \colsep{a}
%%    sets the distance between columns to 'a'
%%    example: \colsep{0.1in}
%%
%%  \outdent{a}
%%    sets the paragraph outdentation for the right column to 'a'
%%    example: \outdent{0.25in}
%%
%%  \name{a}
%%    puts 'a' in large, bold font centered on the current line
%%    example: \name{Frank Stone}
%%
%%  \address{a \\ b \\ c \\ etc}
%%    puts 'a' centered on one line with 'b' beneath, etc.
%%    example: \address{1212 Stoner St. \\ Drugsville, AR 12121}
%%
%%  \section{a}{b}{c}
%%    puts 'a' in the left column in bold.  'b' and 'c' go
%%    in right column.  'b' is in bold. Leave 'a' empty if you
%%    do not want anything there.  Same goes for 'b'.  You can
%%    use \\ to force a line break. 'a' 'b' and 'c' can be as
%%    long as you want.
%%    examples: 
%%      \section{Experience}{Smuggler}{Ran drugs for a cartel}
%%      \section{}{Inmate}{Made license plates. Got time off for good behavior}
%%	\section{Example of \\ stupidity}{Smuggled some more}{got caught}
%% 
%%  \indentitems
%%    indent items in the itemize, enumerate or description environments 
%%    just as the article style does
%%
%%  \noindentitems
%%    make the first level of itemization, enumeration, or description
%%    flush left with the text but still indents nested levels
%%
%% Copyright 1996 Larry Pyeatt
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}
              [1994/12/09 v1.2x LaTeX resume class]

\newcommand\@ptsize{}

\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}

%\def\normalsize{\@setsize\normalsize{12pt}\xpt\@xpt
%\abovedisplayskip 10pt plus2pt minus5pt\belowdisplayskip \abovedisplayskip
%\abovedisplayshortskip \z@ plus3pt\belowdisplayshortskip 6pt plus3pt
%minus3pt\let\@listi\@listI} 
%\def\small{\@setsize\small{11pt}\ixpt\@ixpt
%\abovedisplayskip 8.5pt plus 3pt minus 4pt\belowdisplayskip \abovedisplayskip
%\abovedisplayshortskip \z@ plus2pt\belowdisplayshortskip 4pt plus2pt minus 2pt
%\def\@listi{\leftmargin\leftmargini \topsep 4pt plus 2pt minus 2pt\parsep 2pt
%plus 1pt minus 1pt
%\itemsep \parsep}}
%\def\scriptsize{\@setsize\scriptsize{8pt}\viipt\@viipt}
%\def\tiny{\@setsize\tiny{6pt}\vpt\@vpt}
%\def\large{\@setsize\large{14pt}\xiipt\@xiipt}
%\def\Large{\@setsize\Large{18pt}\xivpt\@xivpt}
%\def\LARGE{\@setsize\LARGE{22pt}\xviipt\@xviipt}
%\def\huge{\@setsize\huge{25pt}\xxpt\@xxpt}
%\def\Huge{\@setsize\Huge{30pt}\xxvpt\@xxvpt}
%\normalsize 

\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
%\fi
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\ExecuteOptions{10pt}
\ProcessOptions
\input{size1\@ptsize.clo}

\newlength{\@leftcolwidth}
\setlength{\@leftcolwidth}{1.2in}

\newlength{\@colsep}
\setlength{\@colsep}{0.1in}

\newlength{\@outdent}
\setlength{\@outdent}{0.25in}

\newlength{\@rightcolwidth}
\newlength{\@totalleftwidth}

\newcommand{\calccol}{\setlength{\@rightcolwidth}{\textwidth}
\addtolength{\@rightcolwidth}{-\@leftcolwidth}
\addtolength{\@rightcolwidth}{-\@outdent}
\addtolength{\@rightcolwidth}{-\@colsep}
\setlength{\@totalleftwidth}{\textwidth}
\addtolength{\@totalleftwidth}{-\@rightcolwidth}}

\calccol

\newcommand{\leftcolwidth}[1]{\setlength{\@leftcolwidth}{#1}\calccol}
\newcommand{\colsep}[1]{\setlength{\@colsep}{#1}\calccol}
\newcommand{\outdent}[1]{\setlength{\@outdent}{#1}\calccol}

\usepackage{ifthen}

\newcommand{\section}[3]{\calccol%
\vspace{0.5\baselineskip}%
\centerline{\hfill\parbox[t]{\@leftcolwidth}{\raggedright\bf #1}%
\hspace{\@colsep}\hspace{\@outdent}%
\parbox[t]{\@rightcolwidth}%
{\hspace{-\@outdent}\ifthenelse{\equal{#2}{}}{#3}{{\bf{#2}}\hspace{1em}#3}}}\hfill}

\newcommand{\name}[1]{\centerline{ \Large \bf #1} \nobreak \vspace{1ex}}

\newcommand{\address}[1]{
\begin{center}
{#1}
\end{center}}

\renewcommand{\line}{\vspace{10pt}
\hrule
\vspace{10pt}
}

%% this stuff was taken from article.cls to make the itemize,
%% enumerate, and description environments work.
\newcommand{\indentitems}{
%\setlength\leftmargini{\@totalleftwidth}
%\setlength\leftmargini{0em}
%\setlength\leftmarginii{\@totalleftwidth}
%\setlength\leftmargini{-\@totalleftwidth}
\setlength\leftmargini{\leftcolwidth}
\addtolength\leftmargini{\colsep}
%\setlength\leftmargini{1em}
\setlength\leftmarginii{.5em}
\setlength\leftmarginiii{2em}
\setlength\leftmarginiv{2.5em}
\setlength\leftmarginv{3em}
\setlength\leftmarginvi{3.5em}
%\setlength\leftmargin{\leftmargini}
\setlength\labelsep{1em}
%\setlength\labelwidth{\leftmargini}
%setlength\labelwidth{0em}
%\addtolength\labelwidth{-\labelsep}
}

\indentitems
\newcount\@nactivelist
\@nactivelist=0

\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\newcommand\labelitemi{$\m@th\bullet$}
\newcommand\labelitemii{\normalfont\bfseries --}
\newcommand\labelitemiii{$\m@th\ast$}
\newcommand\labelitemiv{$\m@th\cdot$}

%I really need to re-define itemize and enumerate here,
%following the model below


\newenvironment{description}{
\advance\@nactivelist\@ne 
\setlength\leftmargin{1em}
%setlength\labelsep{1em}
%if we are at the first level, then add the true left margin
\ifnum\@nactivelist<2
\addtolength\leftmargin\@leftcolwidth
\addtolength\leftmargin\@colsep
\fi
\list{}
{
%\labelwidth\z@
%\itemindent-\leftmargin
%\setlength\leftmargin\@leftcolwidth%
%\addtolength\leftmargin\@colsep
\let\makelabel\descriptionlabel
}}
{\endlist}

\newcommand*\descriptionlabel[1]{\hspace\labelsep\normalfont\bfseries#1}

\textwidth 6.5in
\textheight 9in
\evensidemargin 0in
\oddsidemargin 0in
\headheight 0in
\headsep 0in
\topmargin 0in
\parindent 0in
\pagestyle{empty}
\pagenumbering{arabic}      % Arabic page numbers
\raggedbottom

%      ****************************************
%      *            BIBLIOGRAPHY              *
%      ****************************************
%
%  A bibliography is created by the bibliography environment, which 
%  generates a title such as ``References'', and a list of entries.  
%  The BIBTeX program will create a file containing such an environment,
%  which will be read in by the \bibliography command.  With 
%  BIBTeX, the following commands will be used.
%
%  \bibliography{FILE1,FILE2, ... ,FILEn} : specifies
%     the bibdata files.  Writes a \bibdata entry on the .aux file
%     and tries to read in mainfile.BBL.
%
%  \bibliographystyle{STYLE} : Writes a \bibstyle entry on the .aux file.
% 
%  The thebibliography environment is a list environment.  To save the
%  use of an extra counter, it should use  enumiv  as the item counter.
%  Instead of using \item, items in the bibliography are produced by the 
%  following commands:
%    \bibitem{NAME}             : Produces a numbered entry cited as NAME.
%    \bibitem[LABEL]{NAME}      : Produces an entry labeled by LABEL and 
%                                 cited by NAME.
%  The former is used for bibliographies with citations like [1], [2], etc.;
%  the latter is used for citations like [Knuth82].  
%
%  The document style must define the thebibliography environment.  This
%  environment has a single argument, which is the widest bibliography 
%  label-- e.g., if the [Knuth67] is the widest entry, then thist argument
%  will be Knuth67.  The \thebibliography command must begin a list 
%  environment, which the \endthebibliography command ends.
%
%  Entries are cited by the command \cite{NAME}.
%
%  PARAMETERS
%
%   \@cite     : A macro such that \@cite{LABEL1,LABEL2}{NOTE} 
%                produces the output for a \cite[NOTE]{FOO1,FOO2} command, 
%                where entry FOOi is defined by \bibitem[LABELi]{FOOi}.
%                The switch @tempswa is true if the optional NOTE argument
%                is present.
%                The default definition is :
%                  \@cite{LABELS}{NOTE} ==
%                     BEGIN [LABELS
%                           IF @tempswa = T THEN , NOTE FI
%                           ] 
%                     END
%
%   \@biblabel : A macro to produce the label in the bibliography
%                entry.  For \bibitem[LABEL]{NAME}, the label is 
%                generated by \@biblabel{LABEL}.  It has the default
%                definition \@biblabel{LABEL} -> [LABEL].
%  CONVENTION
%
%  \b@FOO : The name or number of the reference created by \cite{FOO}
%           E.g., if \cite{FOO} -> [17] , then \b@FOO -> 17.
%
%


\def\bibitem{\@ifnextchar[{\@lbibitem}{\@bibitem}}
%\def\bibitem{\@bibitem}
%\def\bibitem#1#2{\section{References}{}{\@gobble}}
%\def\bibitem{\item}

%\def\item#1{\section{}{}{#1}}
%\def\bibitem{\@ifnextchar[{\@lbibitem}{\@bibitem}}

\newboolean{@inminipage}
\setboolean{@inminipage}{false}

\def\@lbibitem[#1]#2{\item[\@biblabel{#1}]\if@filesw 
      { \def\protect##1{\string ##1\space}\immediate
        \write\@auxout{\string\bibcite{#2}{#1}}}\fi\ignorespaces}

\def\@bibitem#1{\item\if@filesw \immediate\write\@auxout
       {\string\bibcite{#1}{\the\c@enumi}}\fi\ignorespaces}

\def\@bibitem#1{
\ifthenelse{\boolean{@inminipage}}{\end{minipage}\par}{}
\item\hspace*{-\@leftcolwidth}\hspace*{-\@colsep}
\parbox[t]{\@leftcolwidth}{\raggedright\bf\@citetitle\par}
\def\@citetitle{ \ }
\begin{minipage}[t]{\@rightcolwidth}
\setboolean{@inminipage}{true}
%\leftmargin\@leftcolwidth%
%\advance\leftmargin\@colsep%
}
%\calccol
%\leftmargin 0in%
%\vspace{0.75\baselineskip}%
%\centerline{\parbox[t]{\@leftcolwidth}{\raggedright\bf Hello}%
%\hspace{\@colsep}\hspace{\@outdent}%
%}}
%\parbox[t]{\@rightcolwidth}%
%{\hspace{-\@outdent}{#2}}}}
%\ifthenelse{\equal{#2}{}}{#3}{{\bf{#2}} #3}}}\hfill}


%\def\bibcite#1#2{\global\@namedef{b@#1}{#2}}
\def\bibcite#1#2{}

\let\citation\@gobble

\def\cite{\@ifnextchar [{\@tempswatrue\@citex}{\@tempswafalse\@citex[]}}

\def\@citex[#1]#2{\if@filesw\immediate\write\@auxout{\string\citation{#2}}\fi
  \def\@citea{}\@cite{\@for\@citeb:=#2\do
    {\@citea\def\@citea{,\penalty\@m\ }\@ifundefined
       {b@\@citeb}{{\bf ?}\@warning
       {Citation `\@citeb' on page \thepage \space undefined}}%
\hbox{\csname b@\@citeb\endcsname}}}{#1}}

\let\bibdata=\@gobble
\let\bibstyle=\@gobble

\def\bibliography#1{\if@filesw\immediate\write\@auxout{\string\bibdata{#1}}\fi
  \@input{\jobname.bbl}}

\def\bibliographystyle#1{\if@filesw\immediate\write\@auxout
    {\string\bibstyle{#1}}\fi}

\def\nocite#1{\@bsphack
  \if@filesw\immediate\write\@auxout{\string\citation{#1}}\fi
  \@esphack}

\def\@cite#1#2{[{#1\if@tempswa , #2\fi}]}
\def\@biblabel#1{}

\newdimen\bibindent
\setlength\bibindent{1.5em}
\newlength\base@adj
\newlength\base@adja
\newenvironment{thebibliography}[1]
{\calccol%
\vspace{0.75\baselineskip}%
%\vspace{\itemsep}%
%\settodepth{\base@adj}%
%{\parbox[t]{\@leftcolwidth}{\raggedright\bf\@citetitle\vspace{0mm}}}%
%\settoheight{\base@adja}%
%{\parbox[t]{\@leftcolwidth}{\raggedright\bf\@citetitle\vspace{0mm}}}%
%\parbox[t]{\@leftcolwidth}{\raggedright\bf\@citetitle\par\vspace{0mm}}
%\addtolength{\base@adj}{\base@adja}
%\hspace{\@colsep}\hspace{\@outdent}%
%\par
%\vspace{-\base@adj}
%\vspace*{-\baselineskip}
%\topsep 0in
\itemsep0.75\baselineskip
%\parbox[t]{0mm}{}
\list{}%
{\leftmargin\@leftcolwidth%
\advance\leftmargin\@colsep%
%\leftmargin 0mm
\@openbib@code%
\usecounter{enumiv}%
\let\p@enumiv\@empty%
\renewcommand\theenumiv{\@arabic\c@enumiv}}%
%\sloppy
%      \clubpenalty4000
%      \@clubpenalty \clubpenalty
%      \widowpenalty4000%
%      \sfcode`\.\@m
}
{\ifthenelse{\boolean{@inminipage}}
{\end{minipage}\setboolean{@inminipage}{false}}{}
\def\@noitemerr
{\@latex@warning{Empty `thebibliography' environment}}%
\endlist
}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
\RequirePackage{bibunits}


\newenvironment{citations}[2]
{\def\@citetitle{#1}
 \def\@citefile{#2}
 \begin{bibunit}[unsrt]}
{\putbib[\@citefile]
\end{bibunit}}
