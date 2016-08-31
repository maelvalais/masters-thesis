#! /bin/bash
#
# figure_included.sh
# Copyright (C) 2016 Maël Valais <mael.valais@gmail.com>
#
# vim: set tw=0:
#

mode=tex
while [ $# != 0 ]; do
    if [ $1 == "--git" ]; then
        mode=git
    fi
    if [ $1 == "--tex" ]; then
        mode=tex
    fi
    if [ $1 == "--git-only" ]; then
        mode=git-only
    fi
    if [ $1 == "--tex-only" ]; then
        mode=tex-only
    fi
    if [ $1 == "-h" -o $1 == "--help" ]; then
        echo "$0 helps you know which files are included (using includegraphics{})"
        echo "in .tex of the current folder. This can be useful for managing figures."
        echo "Usage:"
        echo "    $0 [--tex | --git | --git-only | --tex-only]"
        echo "By default, the --tex option will be assumed."
        echo "Options:"
        echo "    --tex       Return .pdf, .jpg or .png figure that are included using"
        echo "                includegraphics{} (I didn't include .git as pdflatex doesn't"
        echo "                support it)."
        echo "    --git       Return .pdf, .jpg or .png figures already tracked by git."
        echo "    --tex-only  Return .pdf, .jpg or .png figures that are included in your"
        echo "                .tex but not tracked in git"
        echo "    --git-only  Return .pdf, .jpg or .png that are tracked by git but are not"
        echo "                included in any .tex."
        echo "Examples:"
        echo "  1) Add untracked and update already tracked figures in includegraphics{}"
        echo "    $0 | xargs git add"
        echo "  2) Remove from git the files that are not includegraphics{} anymore"
        echo "    $0 --git-only | xargs git add"
        exit
    fi
    shift
done

if [ $mode == "tex" ]; then
    ack '^[^%]*\\includegraphics(\[[^[:space:]]*\])?\{([^[:space:]\\\}]+)\}.*' --type=tex | \
        sed -r 's/^[^%]*\\includegraphics(\[[^[:space:]]*\])?\{([^[:space:]\\\}]+)\}.*/\2/' | \
        sed 's/ *$//g' | sed 's/^ *//g' | sort | uniq
    # sed 's/[\\}]//g' -> remove any left "\" and "}" that could be left
    # sed 's/ *\(.*\) *$/\1/g' -> remove before/after whitespace
elif [ $mode == "git" ]; then
    git ls-files | grep "\.\(pdf\|jpg\|png\)$"
elif [ $mode == "git-only" ]; then
    comm <($0) <($0 --git) -1 -3
elif [ $mode == "tex-only" ]; then
    comm <($0) <($0 --git) -2 -3
fi
