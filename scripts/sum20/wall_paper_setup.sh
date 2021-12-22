#!/bin/bash

path=~/Pictures/Wallpapers/img.jpg
path2=~/Pictures/Wallpapers/img.png

if test -f "$path"; then
	img_date=$(exiftool $path | grep "Source" | awk '{print $3}')
	curr_date=$(date +%Y:%m:%d)
	if [[ "$img_date" != "$curr_date" ]]; then
		curl -o $path https://www.bing.com$(curl "https://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=en-IN" | jq '.images[0].url' | sed -e 's/^"//' -e 's/"$//');
		res=$?
		if test "$res" == "0"; then
			exiftool -XMP:source=$(date +%Y:%m:%d) $path;
			convert $path -blur 0x64 $path2;
		fi
	fi
else
	curl -o $path https://www.bing.com$(curl "https://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=en-IN" | jq '.images[0].url' | sed -e 's/^"//' -e 's/"$//');
	res=$?
	if test "$res" == "0"; then
		exiftool -XMP:source=$(date +%Y:%m:%d) $path;
		convert $path -blur 0x64 $path2;
	fi

	exiftool -XMP:source=$(date +%Y:%m:%d) $path;
	convert $path -blur 0x64 $path2;
fi

feh --bg-fill $path

