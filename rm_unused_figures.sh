#! /bin/bash
#
# rm_unused_figures.sh
# Copyright (C) 2016 Maël Valais <mael.valais@gmail.com>
#
# Use process substitution
# while do
#    ...
# done < <(find samples/ )
unused=_figures
imgused=`./included_figures.sh`

if [ $# -eq 0 ]; then
    echo "dry-run mode"
    mv=false
elif [ $1 == "-f" ]; then
    echo "move mode"
    mv=true
fi
while read f; do
    file=`echo $f | cut -d ":" -f1 | sed "s/^\.\///g"`
    found=false
    while IFS= read -r used && [ $found = false ]; do
        if [ "$file" == "$used" ]; then
            found=true
            echo Stays: "$file"
        fi
    done < <( printf '%s\n' "$imgused" )
    if [ $found = false ]; then
        echo Moves: "$file"
        if [ $mv = true ]; then
            if ! [ -d "$unused" ]; then 
                mkdir "$unused"; 
            fi
            mv "$file" "${unused}/`basename $file`"
        fi
    fi
done < <(find . -type f -exec file {} \; | grep "image data")

