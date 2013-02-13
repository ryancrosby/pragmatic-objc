#! /bin/bash

CTAGS="/usr/local/bin/ctags"
SOURCECODE="$PWD/*"
TAGFILE="$PWD/tags"
CTAGSLANGUAGE="ObjectiveC"
VIMLANGUAGE="objc"
SYNTAXFILE="$PWD/$VIMLANGUAGE-syntax.vim"
SOURCECODEFILELIST="$PWD/TAGFILELIST"

# This command, generates a syntax file from a tags file
# awk -F "\t" '$4 == "interface" {printf("%s\n", $1 )}' commontags| uniq | awk -F "\t" 'BEGIN{printf("syntax keyword objcType\t")}{printf("%s ", $1)}END{print ""}' > syntax

# Generate a list of files to generate tags for
find $PWD -type f -name '*.[hm]' -prune -print > $SOURCECODEFILELIST

# https://ctags.svn.sourceforge.net/svnroot/ctags/trunk/objc.c
TAGCMD="$CTAGS -R 
    --totals=yes
    --language-force=$CTAGSLANGUAGE
    --fields=+kKl
    -L $SOURCECODEFILELIST"

    # These are in case we don't use the xargs pipe
    # --exclude='.git'
    # --exclude='Tumbleweed/build'
    # $SOURCECODE"

    # Not sure what this does
    # --c-kinds=gstu

echo "Running Objective-C Tag Creation: $TAGCMD "
`$TAGCMD`

echo "Running Syntax Creation: $MAKESYNTAXCMD"
# awk 'BEGIN{printf("syntax keyword Type\t")}{printf("%s ", $1 )} END{print ""}' $TAGFILE > $SYNTAXFILE

awk -F "\t" '$4 == "interface" {printf("%s\n", $1 )}' $TAGFILE | uniq | \
    awk -F "\t" 'BEGIN{printf("syntax keyword objcType\t")} {printf("%s ", $1 )} END{print ""}' > $SYNTAXFILE

#awk -F "\t" '$4 == "method" {printf("%s\n", $1 )}' $TAGFILE | uniq | \
#    awk -F "\t" 'BEGIN{printf("syntax keyword objcMethod\t")} {printf("%s ", $1 )} END{print ""}' > $SYNTAXFILE
