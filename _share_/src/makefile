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


# Makefile for compilation and running JAVA examples
# TODO : add similar functionality for other languages.
# TODO : swap to "one application per directory" scheme + support subdirs

#SUBDIRS := $(dir $(wildcard */Main.java))
#  http://www.gnu.org/software/automake/manual/make/Phony-Targets.html#Phony-Targets



RM := rm -f
#JAVAC := javac -verbose
#JAVA := java
JAVAC := /opt/jdk/bin/javac -verbose
JAVA := /opt/jdk/bin/java

.SUFFIXES: .java .class .out

JAVASRC := $(wildcard *.java)
JAVACLS := $(patsubst %.java,%.class,$(wildcard *.java))
JAVAOUT := $(patsubst %.java,%.out,$(wildcard *.java))
## You may wish to define JAVAOUT explicitly to avoid trying to run pieces of 
## code not containing the 'main' method, e.g. if your example programs are
## split into multiple files :
# JAVAOUT := Hello.out More.out Another.out
#
## You may also like to add more dependencies, for example refering to the
## input files.
# ReadingFiles.out : ReadingFiles.in


all : $(JAVACLS) $(JAVAOUT)

.java.class:
	$(JAVAC) $<

.class.out:
	$(JAVA) $* | tee $@

clean :
	$(RM) *.class

cleanall : clean
	$(RM) *.out
