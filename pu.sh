#!/bin/bash

home=$(echo $HOME)
files=$(find . | grep -Ev "^(\.|.*(\.git|pu\.sh).*)$")

script=$(realpath "$0")
dotsdir=$(dirname $script)

for file in $files; do
	if [[ ! -d $file ]]; then
		parentdir=$(dirname $file)
		destdir="${home}/${parentdir}"

		if [[ ! -d $destdir ]]; then
			echo "Initializing ${destdir}"
			mkdir -p "${destdir}"
		fi

		absfrom="${dotsdir}/${file}"
		linktarg="${home}/${file}"

		ln -sfv "${absfrom}" "${linktarg}"
	fi
done
