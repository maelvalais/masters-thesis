#! /bin/bash
#
# rm_mvpath_figures.sh
# Copyright (C) 2016 Maël Valais <mael.valais@gmail.com>
#
# Use process substitution
# while do
#    ...
# done < <(find samples/ )
mvpath=_figures
imgused=`./included_figures.sh`

mv=false
stays_display=true
moves_display=true
one_display=false

while [ $# -ne 0 ]; do
    if [ $1 == "-f" ]; then
        mv=true
    fi
    if [ $1 == "-m" ]; then
        moves_display=false
    fi
    if [ $1 == "-s" ]; then
        stays_display=false
    fi
    shift
done
if [ $moves_display = false -o $stays_display = false ]; then
    one_display=true
fi

if [ $mv = false ]; then
    if [ $one_display = false ]; then echo "dry-run mode"; fi
else
    echo "move mode: are you sure? y/n"
    read c
    if [ $c != "y" ]; then
        exit
    fi
fi

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

