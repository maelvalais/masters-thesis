#! /bin/bash
#
# rm_unused_figures.sh
# Copyright (C) 2016 Maël Valais <mael.valais@gmail.com>
#
# Use process substitution
# while do
#    ...
# done < <(find samples/ )
unused=unused_figures
if ! [ -d "$unused" ]; then 
    mkdir "$unused"; 
fi

imgused=`./included_figures.sh`
i=0
find . -type f -exec file {} \; | grep "image data" | while read f; do
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
        #mv "$file" "${unused}/`basename $file`"
    fi
done

