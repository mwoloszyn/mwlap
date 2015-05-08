# mwlap
Automatically exported from code.google.com/p/mwlap


#    Maciej Woloszyn AGH Krakow <woloszyn@agh.edu.pl> (c) 2010
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.


ABOUT
=====

The aim of the mwlap is to simplify process of creating LaTeX presentations
('screen' version) together with the 'printout' version of the presented
information, especially in the field of computer programming (see LaTeX 
commands below) and when a whole series of presentations using the same style
is needed.

All testing was done on the Linux machine. Except of scripts and Makefile
it should be also usable on other systems with a proper LaTeX software
(e.g. please note that now they depend on symbolic links and standard
Unix tools like grep or sed).

Files in the '99-example' directory contain some examples.


HOWTO
=====

The configuration used by all presentations (titles, style, colours, fonts,
headers, syntax highlighting for included source code, language, encoding etc.)
is defined in files stores in the _share_ directory.
You will need to edit those files to suit them to your needs:
 shared.tex -- included by both versions,
 prn.tex -- included only by the 'printout' version,
 scr.tex -- included only by the 'screen' version.

To create a directory for a new presentation run create_new_presentation.sh
(without parameters to get some help on it).

Then you should cd to the created directory.
- Except configuration purposes only the 'content.tex' files should be edited.
- Compilation to two separate PDF files (*-scr.pdf and *-prn.pdf)
  is easily done by invoking:
    make
  If you need only 'screen' or 'printout' version you may use
    make scr
    make prn
  or simply run pdflatex on *-scr.tex or *-prn.tex
  (Please note that you may need to compile LaTeX files several times
  to obtain correct table of contents and some other things.)
  Also available:
    make clean - removes all file produces by pdflatex except *.pdf
    make cleanall - removes all file produces by pdflatex including *.pdf

Some helpful (re)defined LaTeX commands:
 \newslide ==> produces a new page in the 'screen' version, ignored in the 
               'printout' version
 \SCR{x} ==> x will be visible *only* in the 'screen' version
 \PRN{x} ==> x will be visible *only* in the 'printout' version
 \makeslidetitle{x} ==> produces title page (different for each mode), defines 
                        headers/footers etc.
 \code{x} == \lstinline|x|
 \concept{x} == \textcolor{BrickRed}{x}
 \underl{x} == \textcolor{MidnightBlue}{\underline{x}}
 \TODO{x} == \colorbox{red}{\textcolor{white}{\bf TODO}} \textcolor{red}{#1}
 \Q{x} ==> coloured question mark followed by x
 \W{x} ==> coloured exclamation mark followed by x
 \stdin{x} ==> for presenting interactive input
 \out{x} ==> for presenting output (single line usually)
 \outinclude{filename} ==> for presenting output included from file
and environments:
 outlisting ==> for presenting output

Note: listings containing max. 52 chars at 17 lines fit into the default 
'screen' (papersize={100mm,75mm}, fontsize=10pt)

