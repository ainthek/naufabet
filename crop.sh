#!/bin/bash
rm img/*.*
git ls-files img-orig |\
while read f; 
do
	fn=$(dirname "$f")/../img/$(basename "$f" .gif)

	convert $f -crop 60x60 +repage $fn.png
	# A-1,A-0
	rm $fn-1.png
	mv $fn-0.png $fn.png
done
