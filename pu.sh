#!/bin/bash

home=$(echo "$HOME")

script=$(realpath "$0")
dotsdir=$(dirname "$script")

# Iterate over all files that aren't .git/* or this script
find . | grep -Ev "^(\.|.*(\.git|pu\.sh).*)$" | while read -r file; do
    if [[ ! -d $file ]]; then
        parentdir=$(dirname "$file")
        destdir="${home}/${parentdir}"

        if [[ ! -d $destdir ]]; then
            echo "Initializing ${destdir}"
            mkdir -p "$destdir"
        fi

        absfrom="${dotsdir}/${file}"
        linktarg="${home}/${file}"

        ln -sfv "$absfrom" "$linktarg"
    fi
done
