#!/bin/bash

#    Maciej Woloszyn AGH Krakow <woloszyn@fatcat.ftj.agh.edu.pl> (c) 2010
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


# configuration:
TEMPLATEDIR="./_template_"
CONTENTFILE="content.tex"

# help:
function usage () {
echo "Usage:"
echo "      $0 dirname [chapter]"
echo "$0 creates a new directory based on '${TEMPLATEDIR}' with LaTeX chapter counter optionally set to a given value"
}

# check parameters:
if [ ! -e "$TEMPLATEDIR" ]
then
	echo "$0: $TEMPLATEDIR does not exist"
	usage
	exit 3
fi

if [ "$1" == "" ]
then
	echo "$0: missing dirname"
	usage
	exit 2
fi

DIR="$1"

if [ -e "$DIR" ]
then
	echo "$0: invalid dirname - directory (or file) $DIR already exists"
	usage
	exit 3
fi

if echo "$DIR" | grep  "/"
then
	echo "$0: invalid dirname (contains /)"
	usage
	exit 4
fi

if [ "$2" == "" ]
then
	CH="1"
else
	if echo "$2" | grep -E -x "[[:digit:]]+"
	then
		CH="$2"
	else
		echo "$0: invalid chapter number"
		usage
		exit 5
	fi
fi

# do the job, finally...
echo "Creating directory '${DIR}' and setting LaTeX chapter counter to '${CH}' ..."
cp -a $TEMPLATEDIR $DIR
sed "s/__NUMBER__/${CH}/g" < ${TEMPLATEDIR}/${CONTENTFILE} > ${DIR}/${CONTENTFILE}
mv ${DIR}/__CHAPTER__-prn.tex ${DIR}/${DIR}-prn.tex
mv ${DIR}/__CHAPTER__-scr.tex ${DIR}/${DIR}-scr.tex
echo "Done."
