% resumo.cls
% Copyright 2012 Paulo Urio
% 
% Licensed under the CC-GNU GPL version 2.0 or later.
% See http://creativecommons.org/licenses/GPL/2.0
% 
% Based on Ankur Dave <ankurdave@gmail.com> document class.

\ProvidesClass{resumo}

\LoadClass[11pt]{article}

% fields that user can set (in addition to title, author, etc)
\makeatletter
	\newcommand{\candidatenum}[1]{\def \@candidatenum {#1}}
	\newcommand{\subtitle}[1]{\def \@subtitle {#1}}
	\newcommand{\subject}[1]{\def \@subject {#1}}
	\newcommand{\wordcount}[1]{\def \@wordcount {#1}}
	\newcommand{\email}[1]{\def \@email {#1}}
	\newcommand{\university}[1]{\def \@university {#1}}
	\candidatenum{}
	\subtitle{}
	\subject{}
	\wordcount{}
	\email{}
    \university{}
\makeatother

% margins
\usepackage[top=1in,bottom=1in,left=1in,right=1in]{geometry}

% fonts
\usepackage{helvet}
\renewcommand{\familydefault}{\sfdefault}

% alignment
% (must be before indentation because raggedright clears parindent)
%\raggedright

\usepackage{geometry}
% The left margin is 3cm, and the right margin equals to 2cm.
\setlength{\oddsidemargin}{0.18in}
% for compatibility with twoside print, the length of the margins must
% be exchanged.
\setlength{\evensidemargin}{0in}
% \paperwidth=\textwidth+\oddsidemargin+\hoffset+1in+2cm
\setlength{\textwidth}{6.0in}

% indentation
\usepackage{indentfirst}
\setlength{\parindent}{18pt}
\setlength{\parskip}{1pt}

% spacing
\usepackage{setspace}

% references
\usepackage{varioref}

% figures
\usepackage[pdftex]{graphicx}

% bibliography
\usepackage{natbib}

% page headings and numbering
\makeatletter
	\usepackage{fancyhdr}
	\pagestyle{fancy}
	\renewcommand{\footrulewidth}{\headrulewidth}
	\fancyhf{}

	\newcommand{\updateheaders}{
		\ifx \@candidatenum \@empty
			\relax
		\else
			\fancyfoot[R]{Candidate \#\@candidatenum}
		\fi
		
		\ifx \@author \@empty
			\relax
		\else
			\fancyfoot[L]{\@author}
		\fi

		\ifx \@subtitle \@empty
			\fancyhead[L]{\@title}
		\else
			\fancyhead[L]{\@title: \@subtitle}
		\fi
	}

	\fancyhead[R]{\thepage}
\makeatother

% title
\makeatletter
\def \maketitle {%
		\begin{center}
			{\Large \bfseries \@title} \\
			\ifx \@subtitle \@empty
				\relax
			\else
				\vspace{0.5em}
				{\large \@subtitle} \\
			\fi
		
		
			\ifx @author \@empty
				\relax
			\else
				\@author \\
				\ifx\@email\@empty
					\relax
				\else
					\texttt{\@email} \\
				\fi
				\ifx \@candidatenum \@empty
					\relax
				\else
					Candidate \#\@candidatenum \\
				\fi
			\fi
		
			\ifx \@wordcount \@empty
				\relax
			\else
				Word Count: \@wordcount \\
				\vspace{0.5in}
			\fi
				
            ~\vspace{0.5pt}

			\@university
		\end{center}
}
\makeatother

\makeatletter
\renewcommand\section{\@startsection{section}{1}{\z@}%
                                  {-3.5ex \@plus -1ex \@minus -.2ex}%
                                  {0.8ex \@plus.2ex}%
                                  {\normalfont\large\bfseries}}
\makeatother

