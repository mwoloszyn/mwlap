#  Maciej Woloszyn AGH Krakow <woloszyn@agh.edu.pl> (c) 2010
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
#
# TODO : dependencies, see http://code.google.com/p/latex-makefile/

SCRTEX := $(wildcard *-scr.tex)
PRNTEX := $(wildcard *-prn.tex)

RM := rm -f

all: scr prn

# Produce the slideshow-only LaTeX source file by uncommenting lines
scr:
	pdflatex $(SCRTEX)

# Produce the printout-only LaTeX source file by uncommenting lines
prn:
	pdflatex $(PRNTEX)

clean:
	-$(RM) *~ *.backup *.aux *.toc *.log *.tmp *.out

cleanall:
	-$(RM) *~ *.backup *.bak *.aux *.toc *.dvi *.ps *.log *.tmp *.out *.pdf

cleanpdf:
	-$(RM) *.pdf

cleanps:
	-$(RM) *.ps *.dvi
