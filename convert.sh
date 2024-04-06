#!/bin/sh
# This script requires imagemagick.

image_dir=$1
target_ratio="1080x1080"

if [ -z "$image_dir" ]; then
	echo "Please provide image directory as first argument."
	exit 1
fi

if [ ! -d "$image_dir" ]; then
	echo "Not a valid directory"
	exit 1
fi

output_dir="$image_dir-output"

echo "Located $image_dir"
echo "Creating output $output_dir"
mkdir "$output_dir"

for image in "$image_dir"/*; do
	echo "Processing $image"
	file_name=$(basename "$image")

	# convert -bordercolor white -border 100 -gravity center -resize 1200x1200 -extent 1200x1200 $image $output_dir/$file_name
	convert -background black -gravity center -resize $target_ratio -extent $target_ratio "$image" "$output_dir"/"$file_name"

done
