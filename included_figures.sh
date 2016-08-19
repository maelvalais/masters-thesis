#! /bin/bash
#
# figure_included.sh
# Copyright (C) 2016 Maël Valais <mael.valais@gmail.com>
#
#

mode=latex
while [ $# != 0 ]; do
    if [ $1 == "--git" ]; then
        mode=git
    fi
    if [ $1 == "--latex" ]; then
        mode=latex
    fi
    if [ $1 == "--git-only" ]; then
        mode=git-only
    fi
    if [ $1 == "--latex-only" ]; then
        mode=latex-only
    fi
    if [ $1 == "-h" -o $1 == "--help" ]; then
        echo $0 helps you know which files
    fi
    shift
done

if [ $mode == "latex" ]; then
    ack '^[^%]*\\includegraphics' | sed "s/^.*{\(.*\)}/\1/g" | \
        sed 's/[\\}]//g' | sed 's/ *$//g' | sed 's/^ *//g' | sort | uniq
    # sed 's/[\\}]//g' -> remove any left "\" and "}" that could be left
    # sed 's/ *\(.*\) *$/\1/g' -> remove before/after whitespace
elif [ $mode == "git" ]; then
    git ls-files | grep "\.\(pdf\|jpg\|jpeg\|png\|gif\)$"
elif [ $mode == "git-only" ]; then
    comm <($0) <($0 --git) -1 -3
elif [ $mode == "latex-only" ]; then
    comm <($0) <($0 --git) -2 -3
fi
