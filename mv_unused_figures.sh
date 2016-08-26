#! /bin/bash
#
# rm_mvpath_figures.sh
# Copyright (C) 2016 Maël Valais <mael.valais@gmail.com>
#
# Use process substitution
# while do
#    ...
# done < <(find samples/ )

mv=false
stays_display=true
moves_display=true
one_display=false
mvpath=_figures
while [ $# -ne 0 ]; do
    if [ $1 == "--move" ]; then
        if [ $# -ge 2 -a -d "$2" ]; then
            mvpath=$2
            shift # We must shift $2 in addition to $1
        fi
        mv=true
    elif [ $1 == "-m" ]; then
        moves_display=false
    elif [ $1 == "-s" ]; then
        stays_display=false
    elif [ $1 == "-h" -o $1 == "--help" ]; then
        echo "$0 moves the .pdf, .jpg or .png that are present in your"
        echo "project but that aren't included in any of your .tex."
        echo "Usage:"
        echo "    $0 [-m] [–s] [--move [folder]]"
        echo "Options:"
        echo "    -m               Display figures that are going to be moved"
        echo "    -s               Display figures that are going to stay"
        echo "    --move [folder]  Launch the move process to the --move folder"
        echo "                     By default, the moveto folder is $mvpath."
        echo "By default, lists both moving and staying files."
        echo "Examples:"
        echo "1) First, check that the figures that are going to be moved are correct:"
        echo "    $0 -m"
        echo "2) Second, you can launch the move process"
        echo "    $0 --move _figures"
        exit
    fi
    shift
done
if [ $moves_display = false -o $stays_display = false ]; then
    one_display=true
fi

imgused=`./included_figures.sh`

if [ $mv = false ]; then
    if [ $one_display = false ]; then echo "Dry-run mode"; fi
else
    echo "Are you sure you want to move every unincluded files to $mvpath? y/n"
    read c
    if [ $c != "y" ]; then
        exit
    fi
fi

# TRICK: when I have a $variable with a space-separated string of 
# directories (for example) and I want to do something for each 
# element of that string, I can use $IFS.
#    * IFS stores the characters that serve as delimiters
# Example:
#    while IFS= read -r var; do ...; done

while read f; do
    file=`echo $f | cut -d ":" -f1 | sed "s/^\.\///g"`
    found=false
    while IFS= read -r used && [ $found = false ]; do
        if [ "$file" == "$used" ]; then
            found=true
            output=""
            if [ $one_display = false ]; then
                output="Stays: "
            fi
            if [ $moves_display = true ]; then
                echo "${output}${file}"
            fi
        fi
    done < <( printf '%s\n' "$imgused" )
    if [ $found = false ]; then
        output=""
        if [ $one_display = false ]; then
            output="Moves: "
        fi
        if [ $stays_display = true ]; then
            echo "${output}${file}"
        fi
        if [ $mv = true ]; then
            if ! [ -d "$mvpath" ]; then 
                mkdir "$mvpath"; 
            fi
            cp --parents "$file" "${mvpath}"
            rm "$file"
        fi
    fi
done < <(find . -type f ! -path "*${mvpath}*" -regex '.*\.\(png\|jpg\|pdf\|gif\)' -exec echo {} \;)

